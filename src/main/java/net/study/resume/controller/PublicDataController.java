package net.study.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.study.resume.Constants;
import net.study.resume.entity.Profile;
import net.study.resume.form.SignUpForm;
import net.study.resume.service.FindProfileService;

@Controller
public class PublicDataController {

	@Autowired
	private FindProfileService findProfileService;
	
	
	@RequestMapping(value="/{uid}", method=RequestMethod.GET)
	public String getProfile(@PathVariable("uid") String uid, Model model){
		Profile profile = findProfileService.findByUid(uid);
		if(profile == null) {
			return "profile_not_found";
		}
		model.addAttribute("profile", profile);
		return "profile";
	}
	
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String getError(){
		return "error";
	}
	
	@RequestMapping(value="/sign-up", method=RequestMethod.GET)
	public String getSignUp(){
		return "sign-up";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin() {
		return "login";
	}
	
	@RequestMapping(value="/restore", method=RequestMethod.GET)
	public String getRestoreAccess(){
		return "restore";
	}
	
	@RequestMapping(value="/restore/success", method=RequestMethod.GET)
	public String getRestoreSuccess(){
		return "restore-success";
	}
	
	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public String welcome(Model model){
		Page<Profile> profiles = findProfileService.findAll(new PageRequest(0,	Constants.MAX_PROFILES_PER_PAGE, new Sort("id")));
		model.addAttribute("profiles", profiles.getContent());
		model.addAttribute("page", profiles);
		return "welcome";
	}
	
	@RequestMapping(value="/sign-up", method=RequestMethod.POST)
	public String createProfile(@ModelAttribute("signUpForm") SignUpForm signUpForm, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			return "sign-up";
		}
		//Profile profile = editProfileService.createNewProfile(signUpForm);
		return "redirect:/sign-up-success";
	}
	
	@RequestMapping(value="/sign-up-success")
	public String signUpSuccess(Model model){
		return "/sign-up-success";
	}
	
	@RequestMapping(value="/sign-up-main", method=RequestMethod.GET)
	public String getSignUpMain(){
		return "sign-up-main";
	}
}
