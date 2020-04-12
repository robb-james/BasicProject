package com.irs.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author robb
 * @description	
 * @date 2018/8/3
 */
@Configuration
public class WebAppConfiguration implements WebMvcConfigurer  {
	
	@Autowired
	private AuthorizationInterceptor authorizationInterceptor;
	
	 /**
     * 配置静态资源
     */
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/templates/**").addResourceLocations("classpath:/templates/");
        registry.addResourceHandler("/webapp/**").addResourceLocations("classpath:/webapp/");
    }
	
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
       registry.addInterceptor(authorizationInterceptor).addPathPatterns("/user/**").excludePathPatterns("/user/login").excludePathPatterns("/adminuser/**");
    }
    
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        //设置允许跨域的路径
        registry.addMapping("/**")
                //设置允许跨域请求的域名
                .allowedOrigins("*")
                //是否允许证书 不再默认开启
                .allowCredentials(true)
                //设置允许的方法
                .allowedMethods("*")
                //跨域允许时间
                .maxAge(3600);
    }
}
