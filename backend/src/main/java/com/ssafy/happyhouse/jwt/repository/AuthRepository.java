package com.ssafy.happyhouse.jwt.repository;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ssafy.happyhouse.jwt.entity.Auth;

public interface AuthRepository extends JpaRepository<Auth, Long> {
    Optional<Auth> findByUserId(Long userId);
    Optional<Auth> findById(Long authId);
}