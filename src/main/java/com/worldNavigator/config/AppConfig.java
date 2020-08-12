package com.worldNavigator.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.worldNavigator")
public class AppConfig {
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	@Primary
	public DataSource dataSourceAWS() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUsername("admin");
		dataSource.setPassword("12345678");
		dataSource.setUrl("jdbc:mysql://worldnavigator.cu4r0kurcaer.us-east-1.rds.amazonaws.com:3306/world_navigator");
		return dataSource;
	}


	@Bean
	public DataSource dataSourceLocal() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUsername("root");
		dataSource.setPassword("admin");
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/world_navigator");
		return dataSource;
	}

}
