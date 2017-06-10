package com.hospital.entities;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;

import com.hospital.DbConfig.HibernateDriver;
import com.hospital.models.Disease;
import com.hospital.models.Employee;
import com.hospital.models.EmployeeStatatistic;
import com.hospital.models.Message;
import com.hospital.models.NurseServiceTime;
import com.hospital.models.Room;
import com.hospital.models.SelledDrug;
import java.math.BigDecimal;
import java.math.BigInteger;

public class HospitalService extends HibernateDriver
        implements AdminDAO, UserDAO, ReceptioniestDAO, DoctorDAO, AccountantDAO, PharmatiestDAO, NurseDAO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private static final HospitalService HOSPITAL_SERVICE = new HospitalService();

    private HospitalService() {
    }

    public static HospitalService getInstance() {
        return HOSPITAL_SERVICE;
    }

    public List<Employee> getEmployees(String type) {
        List<Employee> employees = null;
        try {
            openSession();
            employees = getSession().createQuery("From Employee where  type = :type")
                    .setParameter("type", type).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return employees;
    }

    /**
     * Method to Check User if exist or not
     *
     * @param email
     * @param password
     * @return
     */
    public Employee getEmployee(String loginEmailOrName, String password) {
        Employee employee = null;
        try {
            openSession();
            employee = (Employee) getSession()
                    .createQuery(
                            "From Employee where (email= :loginEmailOrName or username= :loginEmailOrName) and password = :password")
                    .setParameter("loginEmailOrName", loginEmailOrName).setParameter("password", password)
                    .uniqueResult();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return employee;
    }

    /**
     * Generic Method to get Object By ID
     *
     * @param employeeID
     * @param clazz
     * @return
     */
    public <T extends Object> Object getObject(int employeeID, Class<T> clazz) {
        Object object = null;
        try {
            openSession();
            object = (Object) getSession().get(clazz, employeeID);

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return object;
    }

    /**
     * Generic saving Object
     *
     * @param object
     * @return
     */
    public <T extends Object> int saveObject(T object) {
        int objectID = 0;
        try {
            openSession();
            objectID = (int) getSession().save(object);

            System.out.println("Object Saved Successfuly...");

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }

        return objectID;
    }

    /**
     * Generic updating Object
     *
     * @param object
     * @return
     */
    public <T extends Object> void updateObject(T object) {
        try {
            openSession();
            getSession().update(object);
        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
    }

    /**
     * Generic deleting Object
     *
     * @param object
     * @return
     */
    public <T extends Object> void deleteObject(T object) {
        try {
            openSession();
            getSession().delete(object);

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
    }

    /**
     * Return List Of Object Defined By Class
     */
    @Override
    public <T extends Object> List<T> getListObjects(Class<T> clazz) {
        List<T> objects = null;
        try {
            openSession();
            objects = getSession().createQuery("From " + clazz.getName()).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return objects;
    }

    public List<Employee> getListEmployeeWithout(int employeeID) {

        List<Employee> employees = null;
        try {
            openSession();

            employees = getSession().createQuery("From Employee where employeeId<> :empID")
                    .setParameter("empID", employeeID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }

        return employees;
    }

    public void deleteAllMessageForEmployee(int employeeID) {
        try {
            openSession();
            String sql = "delete from Messages where from_employee_id= :empID or fto_employee_id= :empID";
            SQLQuery query = getSession().createSQLQuery(sql);
            query.setParameter("empID", employeeID);
            query.executeUpdate();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
    }

    public List<EmployeeStatatistic> getEmployeeStatistic() {
        List<EmployeeStatatistic> employeeStatatistics = null;
        try {
            openSession();
            String sql = "select type,count(employeeId) \"number\" From Employee GROUP By type";
            SQLQuery query = getSession().createSQLQuery(sql).addScalar("type").addScalar("number");
            query.setResultTransformer(Transformers.aliasToBean(EmployeeStatatistic.class));
            employeeStatatistics = query.list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }

        return employeeStatatistics;
    }

    @Override
    public List<Message> getAllMessagesSentByEmployee(Integer employeeID) {
        List<Message> messages = null;
        try {
            openSession();
            messages = getSession()
                    .createSQLQuery("Select * From Messages where from_employee_id= :toEmp ORDER BY messageDate Desc")
                    .addEntity(Message.class).setParameter("toEmp", employeeID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return messages;
    }

    @Override
    public List<Message> getAllMessagesForEmployee(Integer employeeID) {
        List<Message> messages = null;
        try {
            openSession();
            messages = getSession()
                    .createSQLQuery("Select * From Messages where fto_employee_id= :toEmp ORDER BY messageDate Desc")
                    .addEntity(Message.class).setParameter("toEmp", employeeID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return messages;
    }
    
    @Override
    public List<Message> getAllUnreadMessagesForEmployee(Integer employeeID) {
        List<Message> messages = null;
        try {
            openSession();
            messages = getSession()
                    .createSQLQuery("Select * From Messages where fto_employee_id= :toEmp and messageStatus=0 ORDER BY messageDate Desc")
                    .addEntity(Message.class).setParameter("toEmp", employeeID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return messages;
    }

    @Override
    public void deleteAllPatientMessages(int patientID) {
        try {
            openSession();
            String sql = "delete from Messages where patient_id = :patID";
            SQLQuery query = getSession().createSQLQuery(sql);
            query.setParameter("patID", patientID);
            query.executeUpdate();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
    }

    @Override
    public void deleteAllRoomBooked(int roomID) {
        try {
            openSession();
            String sql = "delete from BookBeds where room_id = :roomID";
            SQLQuery query = getSession().createSQLQuery(sql);
            query.setParameter("roomID", roomID);
            query.executeUpdate();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
    }

    @Override
    public List<Disease> getAllDiseaseByEmployeeID(int employeeID) {
        List<Disease> diseases = null;
        try {
            openSession();
            diseases = getSession().createQuery("From Disease where employee_id= :empID")
                    .setParameter("empID", employeeID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return diseases;
    }

    public void composeMessage(Message message) {
        try {
            openSession();
//			String sql = "insert into Messages (messageBody, messageDate, messageStatus, subject, from_employee_id, patient_id, fto_employee_id) values(:mbody,:mdate,:mStatus,:mSubject,:mfromID, :mpatientID,:mToID)";
//			SQLQuery query = getSession().createSQLQuery(sql);
//			query.setParameter("mbody", message.getMessageBody());
//			query.setParameter("mdate", message.getMessageDate());
//			query.setParameter("mStatus", message.isMessageStatus());
//			query.setParameter("mSubject", message.getSubject());
//			query.setParameter("mfromID", message.getFromEmployee());
//			query.setParameter("mToID", message.getToEmployee());
//			query.setParameter("mpatientID", message.getPatient());
            getSession().save(message);
//			query.executeUpdate();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }

    }

    public int getMaxIDObject() {
        BigDecimal maxID = new BigDecimal(0);
        try {
            openSession();
            String sql = "Select max(selledDrugID) from SelledDrugs";
            SQLQuery sQLQuery = getSession().createSQLQuery(sql);
            maxID = (BigDecimal) sQLQuery.uniqueResult();
            
            if(maxID==null)
                maxID=new BigDecimal(BigInteger.ZERO);
            
        } catch (Exception ex) {
            maxID=BigDecimal.ZERO;
        } finally {
            closeSession();
        }
      
       return maxID.intValue();
    }

    @Override
    public void sellDrug(SelledDrug selledDrug) {
        try {
            openSession();
            String sql = "insert into SelledDrugs ( SELLEDDRUGID ,Drug_ID, patient_ID, pharmatiest_ID, quantity, selledDate,unitPerDay,startDate,endDate) values(:1,:2,:3,:4,:5,:6,:7,:8,:9)";
            SQLQuery query = getSession().createSQLQuery(sql);
            query.setParameter("1", selledDrug.getSelledDrugID() + 1);
            query.setParameter("2", selledDrug.getDrug().getDrugId());
            query.setParameter("3", selledDrug.getPatient().getPatientId());
            query.setParameter("4", selledDrug.getPharmatiest().getEmployeeId());
            query.setParameter("5", selledDrug.getQuantity());
            query.setParameter("6", selledDrug.getSelledDate());
            query.setParameter("7", selledDrug.getUnitPerDay());
            query.setParameter("8", selledDrug.getStartDate());
            query.setParameter("9", selledDrug.getEndDate());

            query.executeUpdate();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }

    }

    @Override
    public List<Room> getAllAvailableRoom() {
        List<Room> rooms = null;
        try {
            openSession();

            rooms = getSession().createQuery("From Room WHERE numberOfAvailableBeds >0").list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return rooms;
    }

    public List<SelledDrug> getAllSelledDrugForPatient(int patientID) {
        List<SelledDrug> selledDrugs = null;
        try {
            openSession();
            selledDrugs = getSession().createQuery("From SelledDrug where patient_ID= :patID")
                    .setParameter("patID", patientID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return selledDrugs;
    }

    @Override
    public List<NurseServiceTime> getAllServiceTime(int nurseID) {
        List<NurseServiceTime> nurseServiceTimes = null;
        try {
            openSession();
            nurseServiceTimes = getSession().createQuery("From NurseServiceTime where nurse_id= :nurseID")
                    .setParameter("nurseID", nurseID).list();

        } catch (Exception ex) {
            roleBack();
            ex.printStackTrace();
        } finally {
            closeSession();
        }
        return nurseServiceTimes;

    }

}
