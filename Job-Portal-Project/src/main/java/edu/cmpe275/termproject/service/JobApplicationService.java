package edu.cmpe275.termproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cmpe275.termproject.dao.CompanyDAO;
import edu.cmpe275.termproject.dao.JobApplicationDAO;
import edu.cmpe275.termproject.dao.JobPostingDAO;
import edu.cmpe275.termproject.dao.JobSeekerDAO;
import edu.cmpe275.termproject.model.JobApplication;
import edu.cmpe275.termproject.model.JobPosting;
import edu.cmpe275.termproject.model.JobSeeker;

@Service
public class JobApplicationService {

	@Autowired
	private JobSeekerDAO jobSeekerDAO;
	
	@Autowired
	private JobPostingDAO jobPostingDAO;
	
	@Autowired
	private JobApplicationDAO jobApplicationDAO;

	public String applyJob(String jobId, String jobSeekerUsername) {
		
		JobSeeker applicant = jobSeekerDAO.findByUsername(jobSeekerUsername);
		
		JobPosting job = jobPostingDAO.findByJobId(jobId);
		
		try{
			
			JobApplication jobApplication = new JobApplication("Pending", job, applicant);
			jobApplicationDAO.save(jobApplication);
			
			applicant.getJobPostingList().add(job);
			
			job.getApplicants().add(jobApplication);
			return "success";
		}catch(Exception e){
			System.out.println("Exception in applyJob()");
		}
		
		return "error";
	}

	public String findApplicants(String jobId) {
		
		System.out.println("insde findApplicants()");
		JobPosting job = jobPostingDAO.findByJobId(jobId);
		if(job != null) System.out.println("job is not null");
		
		for(JobApplication applicant : job.getApplicants()){
			
			System.out.println("insde loop");
			System.out.println(applicant.getId());
			System.out.println(applicant.getPostedOn());
			System.out.println(applicant.getStatus());
		}
		
		return null;
	}
}