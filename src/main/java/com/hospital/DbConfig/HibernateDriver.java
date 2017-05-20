package com.hospital.DbConfig;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.Serializable;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author salah
 */

public class HibernateDriver implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Session session;
	private Transaction transaction;

	public HibernateDriver() {
//		session = HibernateUtil.getSessionFactory().openSession();
		System.err.println("Connecting DataBase Success");
	}

	public void openSession() {
		session = HibernateUtil.getSessionFactory().openSession();
		setTransaction(getSession().beginTransaction());
	}
	
	
	
	public void closeSession()
    {
       transaction.commit();
       session.close();
    }
	
	public void roleBack()
	{
		if (transaction!=null)
		transaction.rollback();
	}
	
	/**
	 * @return the session
	 */
	public Session getSession() {
		return session;
	}

	/**
	 * @param session
	 *            the session to set
	 */
	public void setSession(Session session) {
		this.session = session;
	}

	/**
	 * @return the transaction
	 */
	public Transaction getTransaction() {
		return transaction;
	}

	/**
	 * @param transaction
	 *            the transaction to set
	 */
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}

}
