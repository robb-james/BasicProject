package com.irs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.irs.dao")
@ComponentScan("com.irs.*")

public class BasicProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BasicProjectApplication.class, args);
	}
}
