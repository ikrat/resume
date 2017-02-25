package net.study.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.service.FindProfileService;
import net.study.resume.util.SecurityUtil;

@Controller
public class RemoveProfileController {
	
	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private FindProfileService findProfileService;

	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String getRemove(Model model) {
		model.addAttribute("profile", findProfileService.findById(SecurityUtil.getCurrentIdProfile()));
		return "remove";
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String removeConfirm(){
		profileRepository.delete(SecurityUtil.getCurrentIdProfile());
		return "redirect:/sign-out";
	}
}
