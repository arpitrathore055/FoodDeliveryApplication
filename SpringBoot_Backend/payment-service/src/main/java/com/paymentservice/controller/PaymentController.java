package com.paymentservice.controller;

import com.paymentservice.entities.Payment;
import com.paymentservice.services.PaymentServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/payments")
public class PaymentController {

    private final PaymentServiceImpl paymentServiceImpl;

    @PostMapping
    public ResponseEntity<Payment> createPayment(@RequestBody Payment payment){
        return new ResponseEntity<>(paymentServiceImpl.createPayment(payment), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Payment>> findAllPayments(){
        return new ResponseEntity<>(paymentServiceImpl.findAllPayments(),HttpStatus.OK);
    }

    @GetMapping("/{paymentId}")
    public ResponseEntity<Payment> findPaymentById(@PathVariable("paymentId") int paymentId){
        return new ResponseEntity<>(paymentServiceImpl.findPaymentById(paymentId),HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<Payment> updatePayment(@RequestBody Payment payment){
        return new ResponseEntity<>(paymentServiceImpl.updatePayment(payment),HttpStatus.OK);
    }

    @DeleteMapping("/{paymentId}")
    public ResponseEntity<String> deletePayment(@PathVariable("paymentId") int paymentId){
        paymentServiceImpl.deletePayment(paymentId);
        return new ResponseEntity<>("Payment deleted successfully.",HttpStatus.OK);
    }

    @GetMapping("/with-order-id/{orderId}")
    public ResponseEntity<List<Payment>> findPaymentsByOrderId(@PathVariable("orderId") int orderId){
        return new ResponseEntity<>(paymentServiceImpl.findAllPaymentsByOrderId(orderId),HttpStatus.OK);
    }

}
