package com.paymentservice.repositories;

import com.paymentservice.entities.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment,Integer> {

    public List<Payment> findAllByOrderId(int orderId);

}
