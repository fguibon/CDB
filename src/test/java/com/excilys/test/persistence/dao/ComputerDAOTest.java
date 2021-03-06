package com.excilys.test.persistence.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.excilys.exceptions.DatabaseException;
import com.excilys.model.Company;
import com.excilys.model.Computer;
import com.excilys.model.Sorting;
import com.excilys.persistence.dao.ComputerDAO;
import com.excilys.test.ScriptExecuter;
import com.excilys.test.config.TestConfig;
import com.zaxxer.hikari.HikariDataSource;


@RunWith(SpringRunner.class)
@ContextConfiguration(classes = TestConfig.class)
public class ComputerDAOTest {

	private ComputerDAO computerDAO;
	
	private ScriptExecuter executer;
	
	private List<Computer> computers;
	private Company companyTest;
	private Company companyTest2;
	private Computer computerTest;
	private Sorting sorting;

	private HikariDataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	@Before
	public void setUp() throws Exception {
		executer = new ScriptExecuter(dataSource);
		executer.reload();
		
		computerDAO = new ComputerDAO(jdbcTemplate);
		
		computers = new ArrayList<Computer>();
		sorting = new Sorting(1, 10,"","","");
		
		companyTest = new Company.Builder().setId(1L).setName("Apple Inc.").build();
		companyTest2 = new Company.Builder().setId(2L).setName("Thinking Machines").build();
		computerTest = new Computer.Builder().setId(1L).setName("MacBook Pro 15.4 inch")
				.setCompany(companyTest).build();
		
		computers.add(computerTest);
		computers.add(new Computer.Builder().setId(2L).setName("CM-2a").setCompany(companyTest2).build());
		computers.add(new Computer.Builder().setId(3L).setName("CM-200").setCompany(companyTest2).build());
		computers.add(new Computer.Builder().setId(4L).setName("CM-5e").setCompany(companyTest2).build());
		computers.add(new Computer.Builder().setId(5L).setName("CM-5")
				.setIntroduced(LocalDate.of(1991,1,1)).setDiscontinued(LocalDate.of(1991,1,2))
				.setCompany(companyTest2).build());
		computers.add(new Computer.Builder().setId(6L).setName("MacBook Pro")
				.setIntroduced(LocalDate.of(2006,1,10)).setCompany(companyTest).build());
		computers.add(new Computer.Builder().setId(7L).setName("Apple IIe").build());
		computers.add(new Computer.Builder().setId(8L).setName("Apple IIc").build());
		computers.add(new Computer.Builder().setId(9L).setName("Apple IIGS").build());
		computers.add(new Computer.Builder().setId(10L).setName("Apple IIc Plus").build());

	}
	
	
	@Test
	public void createComputerTest() throws DatabaseException {
		computerDAO.create(computerTest);
		computerTest.setId(11L);
		
		assertEquals("Expected same companies",computerTest, computerDAO.findById(11L));
		
	}
	
	@Test
	public void findAllTest() throws DatabaseException {
		List<Computer> findAll = computerDAO.findAll();
		for(int i=0;i<computers.size();i++) {
			assertEquals(computers.get(i), findAll.get(i));
		}
		assertEquals("List different from  expected",computers, findAll);
	}
	
	@Test
	public void findAllPagedTest() throws DatabaseException {
		assertEquals("List different from expected",computers, computerDAO.findAllPaged(sorting));
	}
	
	@Test
	public void findByIdTest() throws DatabaseException {	
		assertEquals("Can't find computer",computerTest, computerDAO.findById(1L));
	}
	
	@Test
	public void updateTest() throws DatabaseException {
		computerDAO.update(computerTest);
		assertEquals("Objects should be equals",computerTest, computerDAO.findById(1L));
	}
	
	@Test
	public void countTest() throws DatabaseException {
		assertSame(10,computerDAO.count());
	}

	@Autowired
	public void setDataSource(HikariDataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
}
