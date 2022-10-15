package com.yeshua.clinicapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig {
	
	private UserDetailsService userDetailsService;
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http.
			authorizeRequests()
				.antMatchers("/css/**","/images/**" ,"/js/**", "/webjars/**", "/registration", "/").permitAll()
				.antMatchers("/doctors", "/careers/**").permitAll()
				.antMatchers("/patient/**").access("hasAnyRole('PATIENT', 'ADMIN')")
				.antMatchers("/doctor/**").access("hasAnyRole('DOCTOR', 'ADMIN')")
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				.antMatchers("/{id}/delete").access("hasRole('ADMIN')")
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/login")
				.defaultSuccessUrl("/home")
				.usernameParameter("email")
				.permitAll()
				.and()
			.logout()
				.permitAll();
		
		return http.build();
	}
	
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    } 
}
