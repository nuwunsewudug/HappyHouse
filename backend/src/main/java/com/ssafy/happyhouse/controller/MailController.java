package com.ssafy.happyhouse.controller;

import com.ssafy.happyhouse.model.dto.MailDto;
import com.ssafy.happyhouse.model.service.MailService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@Controller
@RequiredArgsConstructor
public class MailController {
    private final MailService mailService;

    @GetMapping("/mail")
    public String dispMail() {
        return "mail";
    }

    @PostMapping("/mail")
    public void execMail(@RequestBody MailDto mailDto) {
        mailService.mailSend(mailDto);
    }
}