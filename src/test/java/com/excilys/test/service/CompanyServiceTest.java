package com.excilys.test.service;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.excilys.binding.dto.CompanyDTO;
import com.excilys.binding.mapper.CompanyMapper;
import com.excilys.model.Company;
import com.excilys.persistence.dao.CompanyDAO;
import com.excilys.service.CompanyService;

public class CompanyServiceTest {

	CompanyService service;
	List<Company> companies;
	List<CompanyDTO> companiesDTO;
	
	@Mock
	CompanyDAO daoMock;

	@Mock
	CompanyMapper mapperMock;
	
	@Before
	public void setUp() throws Exception {

		MockitoAnnotations.initMocks(this);
		companies = new ArrayList<Company>();
		companies.add(new Company.Builder().setId(4L).setName("NASA").build());
		companies.add(new Company.Builder().setId(10L).setName("ESA").build());
		
		companiesDTO = new ArrayList<CompanyDTO>();
		companiesDTO.add(new CompanyDTO.Builder().setId("4").setName("NASA").build());
		companiesDTO.add(new CompanyDTO.Builder().setId("10").setName("ESA").build());
		
		when(daoMock.findAll()).thenReturn(companies);
		
		service = CompanyService.getInstance();
	}
	
	@Test
	public void test_getCompanies() {
		assertEquals("Expected same companies",companiesDTO,service.getCompanies());
	}
	


}
