package com.excilys.test.validator;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.excilys.binding.dto.CompanyDTO;
import com.excilys.binding.dto.ComputerDTO;
import com.excilys.binding.mapper.ComputerMapper;
import com.excilys.exceptions.DateParseException;
import com.excilys.exceptions.ValidationException;
import com.excilys.test.config.TestConfig;
import com.excilys.validator.Validator;

@ActiveProfiles("test")
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = TestConfig.class)
public class ValidatorTest {

	private Validator validator;
	private ComputerDTO computerDto;
	private CompanyDTO companyDto;
	
	@Autowired
	private ComputerMapper computerMapperMock;
		
	
	@Before
	public void setUp() throws DateParseException {
		validator = new Validator(computerMapperMock);
		computerDto = new ComputerDTO.Builder().setId("1").setName("Mac Book").build();
		companyDto = new CompanyDTO.Builder().setId("1").setName("Apple Inc.").build();
		
		Mockito.when(computerMapperMock.castLocalDate("")).thenReturn(null);
	}
	
	@Test
	public void validateComputerToCreateTest() throws ValidationException, DateParseException {
		assertTrue(validator.validateComputerToCreate(computerDto));
	}
	
	@Test
	public void validateComputerToUpdateTest() throws ValidationException, DateParseException {
		assertTrue(validator.validateComputerToUpdate(computerDto));
	}
	
	@Test
	public void validateCompany() throws ValidationException {
		assertTrue(validator.validateCompany(companyDto));
	}
}