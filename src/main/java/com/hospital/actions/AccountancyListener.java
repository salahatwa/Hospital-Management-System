package com.hospital.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hospital.entities.AccountantDAO;
import com.hospital.entities.HospitalService;
import com.hospital.models.BookBed;
import com.hospital.models.Room;

public class AccountancyListener {

    private static AccountancyListener accountancyListener = new AccountancyListener();

    private static AccountantDAO accountantDAO = HospitalService.getInstance();

    private AccountancyListener() {
    }

    public static AccountancyListener getInstance() {
        return accountancyListener;
    }

    public void checkedPatientFees(HttpServletRequest request, HttpServletResponse response) {

        try {
            int bid = Integer.parseInt(request.getParameter("bid"));

            BookBed bookBed = (BookBed) accountantDAO.getObject(bid, BookBed.class);

            System.out.println("Test Patient Fess:" + bookBed.isStatus());
            if (bookBed.isStatus()) {
                bookBed.setStatus(false);
            } else {

                Room room = bookBed.getRoom();
                room.setNumberOfAvailableBeds(room.getNumberOfAvailableBeds() + 1);
                accountantDAO.updateObject(room);
                bookBed.setStatus(true);
            }

            accountantDAO.updateObject(bookBed);
            response.sendRedirect("computefees.jsp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
