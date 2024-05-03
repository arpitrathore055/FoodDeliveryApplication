package com.paymentservice.services;

import com.paymentservice.entities.Payment;

import java.util.List;

public interface PaymentService {

    public List<Payment> findAllPayments();
    public Payment findPaymentById(Integer paymentId);
    public Payment createPayment(Payment payment);
    public Payment updatePayment(Payment payment);
    public void deletePayment(Integer paymentId);
    public List<Payment> findAllPaymentsByOrderId(int orderId);

}
