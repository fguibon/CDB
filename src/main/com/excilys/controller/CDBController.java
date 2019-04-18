package main.com.excilys.controller;

import java.util.ArrayList;
import java.util.List;

import main.com.excilys.model.Company;
import main.com.excilys.model.Computer;
import main.com.excilys.service.CompanyService;
import main.com.excilys.service.ComputerService;
import main.com.excilys.view.CDBView;

public class CDBController {

	CDBView view;
	CompanyService cpnService;
	ComputerService cptService;
	
	public CDBController(CDBView view, CompanyService cpnService, ComputerService cptService){
		this.view=view;
		this.cpnService=cpnService;
		this.cptService=cptService;
	}
	
	/**
	 * Function calling the display of the starting menu
	 */
	public void start() {
		boolean ok = true;
		while(ok) {
			int choice =view.menu();
			switch(choice) {
				case 0:
					view.bye();
					ok=false;
					break;
				case 1:
					listComputers();
					break;
				case 2:
					listCompanies();
					break;
				case 3:
					showComputerDetail();
					break;
				case 4:
					createComputer();
					break;
				case 5:
					updateComputer();
					break;
				case 6:
					deleteComputer();
					break;
				default:
					view.notifyInvalidNumber();
			}
		}
	}
	

	/**
	 * option 1
	 */
	public void listComputers() {
		List<Computer> computers = new ArrayList<Computer>();
		computers = this.cptService.getComputers();
		this.view.displayComputers(computers);
	}
	
	/**
	 * option 2
	 */
	public void listCompanies() {
		List<Company> companies = new ArrayList<Company>();
		companies = this.cpnService.getCompanies();
		this.view.displayCompanies(companies);
	}
	
	/** 
	 * option 3
	 */
	public void showComputerDetail() {
		Computer computer = null;
		Long id = this.view.queryId();
		if(id!=null) computer = this.cptService.findById(id);
		if(computer!=null) {
			this.view.displayComputer(computer);
		}
	}
	
	/**
	 * option 4
	 */
	public void createComputer() {
		Computer computer =null;
		computer = this.view.queryComputerToCreate();
		if(computer!=null) this.cptService.createComputer(computer);
	}
	

	/**
	 * option 5
	 */
	public void updateComputer() {
		Computer computer = this.view.queryComputerToUpdate();
		this.cptService.update(computer);	
	}
	
	/**
	 * option 6
	 */
	public void deleteComputer() {
		Long id = this.view.queryComputerToDelete();
		this.cptService.delete(id);	
	}


}
