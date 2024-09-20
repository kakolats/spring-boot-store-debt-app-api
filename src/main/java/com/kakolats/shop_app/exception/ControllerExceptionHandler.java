package com.kakolats.shop_app.exception;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ControllerExceptionHandler {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<String> handleUserNotFoundException(EntityNotFoundException e) {
        // Log the exception details if necessary
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
    }
}
