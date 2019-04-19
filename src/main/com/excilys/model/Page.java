package main.com.excilys.model;

public class Page {

	private int currentPage;
	private int entriesPerPage;
	
	public Page(int entriesPerPage, int currentPage) {
		this.setCurrentPage(currentPage);
		this.setEntriesPerPage(entriesPerPage);
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the entriesPerPage
	 */
	public int getEntriesPerPage() {
		return entriesPerPage;
	}

	/**
	 * @param entriesPerPage the entriesPerPage to set
	 */
	public void setEntriesPerPage(int entriesPerPage) {
		this.entriesPerPage = entriesPerPage;
	}
	
}