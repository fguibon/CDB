package com.excilys.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.excilys.binding.dto.CompanyDTO;
import com.excilys.binding.mapper.CompanyMapper;
import com.excilys.exception.DatabaseQueryException;
import com.excilys.model.Company;
import com.excilys.model.Page;
import com.excilys.persistence.dao.CompanyDAO;

public class CompanyService {
	
	private static CompanyService instance = new CompanyService();
	private static final Logger logger = 
			LogManager.getLogger(CompanyService.class);
	
	private CompanyDAO companyDAO = CompanyDAO.getInstance();
	private CompanyMapper companyMapper = CompanyMapper.getInstance();
	
	private CompanyService() {}
	
	public static CompanyService getInstance() {
		return instance;
	}
	
	public List<CompanyDTO> getCompanies() {
		List<Company> companies = new ArrayList<Company>();
		try {
			companies = companyDAO.findAll();
		} catch (DatabaseQueryException e) {
			logger.error("Query error");
		}
		List<CompanyDTO> companiesDTO = (List<CompanyDTO>)companies
		.stream().map(s -> companyMapper.modelToDto(s))
		.collect(Collectors.toList());
		return companiesDTO;
	}
	

	public List<CompanyDTO> getCompanies(Page page, int currentPage) {
		List<Company> companies = new ArrayList<Company>();
		try {
			companies = companyDAO.findAllPaged(page.getEntriesPerPage(), currentPage);
		} catch (Exception e) {
			logger.error("Query error");
		}
		List<CompanyDTO> companiesDTO = (List<CompanyDTO>)companies
		.stream().map(s -> companyMapper.modelToDto(s))
		.collect(Collectors.toList());
		return companiesDTO;
	}
	 
}
