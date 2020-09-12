package com.wxh.springcloud;

import com.wxh.myRule.MySelfRule;
import com.wxh.myRule.MySelfRule2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.ribbon.RibbonClient;

@SpringBootApplication
@EnableEurekaClient
// 选择要接收的服务和配置类
@RibbonClient(name = "CLOUD-PAYMENT-SERVICE",configuration = MySelfRule2.class)
public class OrderMain80 {
    public static void main(String[] args) {
        SpringApplication.run(OrderMain80.class,args);
    }
}
