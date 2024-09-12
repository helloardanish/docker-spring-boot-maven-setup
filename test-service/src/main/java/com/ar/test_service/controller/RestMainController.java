package com.ar.test_service.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class RestMainController {
    private static final Logger logger = LoggerFactory.getLogger(RestMainController.class);

    @GetMapping("/test")
    public String test(){
        logger.info("Test called");
        return "testing is live ok ok test without building it works right just re run the command docker compose up. Yeah and also run pretty fast as dependency is taken from cache";
    }
}