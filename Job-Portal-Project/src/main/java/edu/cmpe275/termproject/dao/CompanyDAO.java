package edu.cmpe275.termproject.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import edu.cmpe275.termproject.model.Company;

public interface CompanyDAO extends CrudRepository<Company, Long>{
	Company findByEmail(String email);
	Company findByCompanyId(long companyId);
	public List<Company> findByNameCompanyName (String companyName);
	
	@Query("SELECT c FROM Company c WHERE LOWER(c.companyName) IN (:companyName) AND c.companyName != 'askl'")
    public List<Company> findCompanyByName(@Param("companyName") List<String> companyName);
}
