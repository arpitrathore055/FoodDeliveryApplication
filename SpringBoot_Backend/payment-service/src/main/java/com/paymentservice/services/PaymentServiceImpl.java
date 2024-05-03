package com.paymentservice.services;

import com.paymentservice.entities.Payment;
import com.paymentservice.repositories.PaymentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService{

    private final PaymentRepository paymentRepository;

    @Override
    public List<Payment> findAllPayments() {
        return paymentRepository.findAll();
    }

    @Override
    public Payment findPaymentById(Integer paymentId) {
        return paymentRepository.findById(paymentId).orElseThrow(()->new RuntimeException("PAYMENT NOT FOUND"));
    }

    @Override
    public Payment createPayment(Payment payment) {
        Payment savedPayment=Payment.builder()
                .orderId(payment.getOrderId())
                .paymentMethod(payment.getPaymentMethod())
                .amount(payment.getAmount())
                .status(payment.getStatus())
                .build();
        return paymentRepository.save(savedPayment);
    }

    @Override
    public Payment updatePayment(Payment payment) {
        Payment fetchedPayment=paymentRepository.findById(payment.getId()).orElseThrow(()->new RuntimeException("PAYMENT NOT FOUND"));
        fetchedPayment.setPaymentMethod(payment.getPaymentMethod());
        fetchedPayment.setAmount(payment.getAmount());
        fetchedPayment.setStatus(payment.getStatus());
        fetchedPayment.setOrderId(payment.getOrderId());
        return paymentRepository.save(fetchedPayment);
    }

    @Override
    public void deletePayment(Integer paymentId) {
        Payment fetchedPayment=paymentRepository.findById(paymentId).orElseThrow(()->new RuntimeException("PAYMENT NOT FOUND"));
        paymentRepository.delete(fetchedPayment);
    }

    @Override
    public List<Payment> findAllPaymentsByOrderId(int orderId) {
        return paymentRepository.findAllByOrderId(orderId);
    }

}
