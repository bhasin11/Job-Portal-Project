package edu.cmpe275.termproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import edu.cmpe275.termproject.dao.CompanyDAO;
import edu.cmpe275.termproject.dao.JobPostingDAO;
import edu.cmpe275.termproject.model.Company;
import edu.cmpe275.termproject.model.JobPosting;
@Service
public class JobService {
	@Autowired
	JobPostingDAO jobPostingDao;
	
	@Autowired
	CompanyDAO companyDAO;
	
	public JobPosting addJob(JobPosting job){
		jobPostingDao.save(job);
		return job;
	}	
	public JobPosting getJob(String jobId){
		return jobPostingDao.findByJobId(jobId);
	}
	public void removeJob(JobPosting job){
		jobPostingDao.delete(job);
	}
	
	public ArrayList<JobPosting> getTop10NewJobListings(){
		//ArrayList<JobPosting> jobList = new ArrayList<JobPosting>();
		PageRequest pr = new PageRequest(1,1);
		ArrayList<JobPosting> jobList = jobPostingDao.findTop10jobs(pr);
		 System.out.println("inside job service - jobList size: "+jobList.size());
		
		return jobList;
	}
	
	public List<JobPosting> getPositions(String jobId, 
			String title, String location, String salary,
			String status, String postedOn) {
		
		System.out.println("inside getPositions()");
		
		List<String> jobTitleList = null;
		List<String> jobLocationList = null;
		List<String> jobSalaryList = null;
		List<String> jobStatusList = null;
		List<String> jobPostedOnList = null;
		int tempTitle = 1, 
				tempJobLocation = 1, tempJobSalary = 1,
				tempJobStatus = 1, tempPostedOn = 1;
		
		if(title != null && title.length() != 0){
			tempTitle = 0;
			jobTitleList = Arrays.asList(title.split(","));
		}
		
		if(location != null && location.length() != 0){
			tempJobLocation = 0;
			jobLocationList = Arrays.asList(location.split(","));
		}
		
		if(salary != null && salary.length() != 0){
			tempJobSalary = 0;
			jobSalaryList = Arrays.asList(salary.split(","));
		}
		
		if(status != null && status.length() != 0){
			tempJobStatus = 0;
			jobStatusList = Arrays.asList(status.split(","));
		}
		
		if(postedOn != null && postedOn.length() != 0){
			tempPostedOn = 0;
			jobPostedOnList = Arrays.asList(postedOn.split(","));
		}
		
		System.out.println("tempTitle "+tempTitle);
		System.out.println("tempJobLocation "+tempJobLocation);
		System.out.println("tempJobSalary "+tempJobSalary);
		System.out.println("tempJobStatus "+tempJobStatus);
		System.out.println("tempPostedOn "+tempPostedOn);

		List<JobPosting> positions = jobPostingDao.findJobs(jobTitleList, 
				jobLocationList, jobSalaryList, jobStatusList, jobPostedOnList, 
				tempTitle, tempJobLocation, tempJobSalary, tempJobStatus, tempPostedOn);
		
		//System.out.println("titles "+jobIdList);
		
		
		for(JobPosting position : positions){
			System.out.println("inside loop");
			System.out.println("getJobId  "+position.getJobId());
			System.out.println("getJobDescription "+position.getJobDescription());
			System.out.println("getJobTitle "+position.getJobTitle());
			System.out.println("getJobResponsibilities "+position.getJobResponsibilities());
			System.out.println("getJobLocation "+position.getJobLocation());
			System.out.println("getJobSalary "+position.getJobSalary());
			System.out.println("getJobStatus "+position.getJobStatus());
			System.out.println("getPostedOn "+position.getPostedOn());
			System.out.println("getEligibility "+position.getEligibility());
		}
				
		return positions;
	}
	public List<JobPosting> findFromSearchString(String searchString) {
		// TODO Auto-generated method stub
		String[] searchStringArray = searchString.split(" "); //Include regex to split by comma etc.
		List<JobPosting> searchStringLists = new ArrayList<JobPosting>();
		for (String str : searchStringArray){
			if(jobPostingDao.findByJobDescription(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobDescription(str));
			}
			
			if(jobPostingDao.findByJobId(str) != null){
				searchStringLists.add(jobPostingDao.findByJobId(str));
				
			}
			
			if(jobPostingDao.findByJobLocation(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobLocation(str));
			}
			
			if(jobPostingDao.findByJobResponsibilities(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobResponsibilities(str));
			}
			
			if(jobPostingDao.findByJobSalary(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobSalary(str));
			}
			
			if(jobPostingDao.findByJobStatus(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobStatus(str));
			}
			
			if(jobPostingDao.findByJobTitle(str).size() > 0){
				searchStringLists.addAll(jobPostingDao.findByJobTitle(str));
			}
			
			if(companyDAO.findByNameCompanyName(str).size() > 0){
				List<Company> companies = companyDAO.findByNameCompanyName(str);
				for (Company company : companies){
					searchStringLists.addAll(company.getJobPostingList());
				}
			}
		}
			
		
		
		return searchStringLists;
	}	
	public List<JobPosting> searchBySalaryRange(int min, int max){
		ArrayList<JobPosting> jobList = jobPostingDao.findBySalaryRange(min,max);
		return null;
	}
}