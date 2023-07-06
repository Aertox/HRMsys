package com.xs.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xs.dao.DeptDao;
import com.xs.dao.EmployeeDao;
import com.xs.dao.JobDao;
import com.xs.dao.NoticeDao;
import com.xs.dao.UserDao;
import com.xs.dao.DocumentDao;
import com.xs.domain.Dept;
import com.xs.domain.Document;
import com.xs.domain.Employee;
import com.xs.domain.Job;
import com.xs.domain.Notice;
import com.xs.domain.User;
import com.xs.service.HrmService;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("HrmService")
public class HrmServiceImpl implements HrmService {

	@Autowired
	private DeptDao deptDao;
	@Autowired
	private JobDao jobDao;
	@Autowired
	private EmployeeDao employeedao;
	@Autowired
	private NoticeDao noticedao;
	@Autowired
	private DocumentDao documentdao;
	@Autowired
	private UserDao userdao;

	/**
	 * 部门信息的管理
	 */
	@Transactional(readOnly=true)
	@Override
	public List<Dept> findAllDept() {
		return deptDao.selectAllDept();
	}
	@Override
	public void addDept(Dept dept) {
		// 
		deptDao.save(dept);
	}
	
	@Override
	public Dept get_Info(Integer id) {
		// 
		Dept dept = deptDao.get_Info(id);
		return dept;
	}
	@Override
	public void update_Info(Dept dept) {
		// 
		deptDao.update_Info(dept);
	}
	@Override
	public void delete_Info(Integer id) {
		// 
		deptDao.delete_Info(id);
	}
	@Override
	public List<Dept> findAllDept(String content) {
		// 
		System.out.println(content);
		return deptDao.selectLikeAllDept(content);
	}
	/**
	 * 职位管理的操作
	 */
	@Override
	public List<Job> findAllJob() {
		// 
		return jobDao.get_List();
	}
	@Override
	public List<Job> findAllJob(String content) {
		// 
		return jobDao.get_LikeList(content);
	}
	
	@Override
	public Job get_JobInfo(Integer id) {
		// 
		return jobDao.get_Info(id);
	}
	@Override
	public void update_JobInfo(Job job) {
		// 
		jobDao.update_Info(job);
	}
	@Override
	public void insert_JobInfo(Job job) {
		// 
		jobDao.insert_Info(job);
	}
	@Override
	public void delete_JobInfo(Integer id) {
		// 
		jobDao.delete_Info(id);
	}
	/**
	 * 员工信息的管理
	 */
	@Override
	public List<Employee> get_EmployeeList() {
		// 
		/**
		 * 将部门，职位id中的信息提取出来
		 */
		List<Employee> list = employeedao.get_List();
		int size = list.size();
		List<Employee> list2 = new ArrayList<>();
		for(int i = 0;i<size;i++){
			Employee data = list.get(i);
			Dept dept = deptDao.get_Info(data.getDept_id());
			data.setDept(dept);
			Job job = jobDao.get_Info(data.getJob_id());
			data.setJob(job);
			list2.add(i,data);
		}
		return list2;
	}
	@Override
	public List<Employee> get_EmployeeLikeList(String content) {
		// 
		/**
		 * 将部门，职位id中的信息提取出来
		 */
		List<Employee> list = employeedao.get_LikeList(content);
		int size = list.size();
		List<Employee> list2 = new ArrayList<>();
		for(int i = 0;i<size;i++){
			Employee data = list.get(i);
			Dept dept = deptDao.get_Info(data.getDept_id());
			data.setDept(dept);
			Job job = jobDao.get_Info(data.getJob_id());
			data.setJob(job);
			list2.add(i,data);
		}
		return list2;
	}
	@Override
	public Employee get_EmployeeInfo(Integer id) {
		// 
		Employee data = employeedao.get_Info(id);
		Dept dept = deptDao.get_Info(data.getDept_id());
		data.setDept(dept);
		Job job = jobDao.get_Info(data.getJob_id());
		data.setJob(job);
		return data;
	}
	@Override
	public void update_EmployeeInfo(Employee data) {
		// 
		employeedao.update_Info(data);
	}
	@Override
	public void insert_EmployeeInfo(Employee data) {
		// 
		/**
		 * 将职位id和部门id提取，或者不管，因为直接存到数据库了
		 */
		Date date = new Date();    
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		data.setCreate_date(sdf.format(date));
		System.out.println(data.getPassword()+"0000000000000000");
		employeedao.insert_Info(data);
	}
	@Override
	public void delete_EmployeeInfo(Integer id) {
		// 
		System.out.print(id);
		employeedao.delete_Info(id);
	}
	/**
	 * 公告管理
	 */
	@Override
	public List<Notice> get_NoticeList() {
		// 
		return noticedao.get_List();
	}
	@Override
	public List<Notice> get_NoticeLikeList(String content) {
		// 
		return noticedao.get_LikeList(content);
	}
	@Override
	public Notice get_NoticeInfo(Integer id) {
		// 
		return noticedao.get_Info(id);
	}
	@Override
	public void update_NoticeInfo(Notice notice) {
		// 
		noticedao.update_Info(notice);
	}
	@Override
	public void insert_NoticeInfo(Notice notice) {
		// 
//		Date date = new Date();    
//		String year = String.format("%tY", date);   
//		String month = String.format("%tB", date);   
//		String day = String.format("%te", date);   
//		notice.setCreate_date(year+month+day);
		noticedao.insert_Info(notice);
	}
	@Override
	public void delete_NoticeInfo(Integer id) {
		// 
		noticedao.delete_Info(id);
	}
	/**
	 * 文档管理
	 */
	@Override
	public List<Document> get_DocumentList() {
		// 
		return documentdao.get_List();
	}
	@Override
	public List<Document> get_DocumentLikeList(String content) {
		// 
		return documentdao.get_LikeList(content);
	}
	@Override
	public Document get_DocumentInfo(Integer id) {
		// 
		return documentdao.get_Info(id);
	}
	@Override
	public void update_DocumentInfo(Document notice) {
		// 
		documentdao.update_Info(notice);
	}
	@Override
	public void insert_DocumentInfo(Document notice) {
		// 
//		Date date = new Date();    
//		String year = String.format("%tY", date);   
//		String month = String.format("%tB", date);   
//		String day = String.format("%te", date);   
//		notice.setCreate_date(year+month+day);
		documentdao.insert_Info(notice);
	}
	@Override
	public void delete_DocumentInfo(Integer id) {
		// 
		documentdao.delete_Info(id);
	}
	@Override
	public User login(String loginname, String password) {
		// 
		User user = userdao.get_login(loginname,password);
		return user;
	}
	@Override
	public List<User> get_UserList() {
		// 
		return userdao.get_List();
	}
	@Override
	public List<User> get_UserLikeList(String content) {
		// 
		return userdao.get_LikeList(content);
	}
	@Override
	public User get_UserInfo(Integer id) {
		// 
		return userdao.get_Info(id);
	}
	@Override
	public void update_UserInfo(User notice) {
		// 
		userdao.update_Info(notice);
	}
	@Override
	public void insert_UserInfo(User notice) {
		// 
//		Date date = new Date();    
//		String year = String.format("%tY", date);   
//		String month = String.format("%tB", date);   
//		String day = String.format("%te", date);   
//		notice.setCreate_date(year+month+day);
		userdao.insert_Info(notice);
	}
	@Override
	public void delete_UserInfo(Integer id) {
		// 
		userdao.delete_Info(id);
	}
	@Override
	public User login2(String loginname, String password) {
		// 
		return userdao.get_login(loginname,password);
	}
}
