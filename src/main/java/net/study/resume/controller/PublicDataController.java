package net.study.resume.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
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
import net.study.resume.model.CurrentProfile;
import net.study.resume.service.EditProfileService;
import net.study.resume.service.FindProfileService;
import net.study.resume.util.SecurityUtil;

@Controller
public class PublicDataController {

	@Autowired
	private FindProfileService findProfileService;
	
	@Autowired
	private EditProfileService editProfileService;
	
	
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
	public String getRestore(){
		return "restore";
	}
	
	@RequestMapping(value="/restore/success", method=RequestMethod.GET)
	public String getRestoreSuccess(){
		return "restore-success";
	}
	
	@RequestMapping(value="/restore", method=RequestMethod.POST)
	public String postRestore(@ModelAttribute("anyUniqueId") String anyUniqueId, Model model) {
		Profile profile = findProfileService.findByUniqueId(anyUniqueId);
		if(profile != null) {
			editProfileService.addRestoreToken(profile.getId(), SecurityUtil.generateNewRestoreAccessToken());
		}
		return "redirect:/restore/success";
	}
	
	@RequestMapping(value="/restore/{token}", method=RequestMethod.GET)
	public String restoreAccess(@PathVariable("token") String token, Model model){
		Profile profile = findProfileService.findByRestoreToken(token);
		if(profile == null) {
			return "error";
		}
		SecurityUtil.authentificate(profile);
		editProfileService.removeRestoreToken(profile.getId());
		return "redirect:/edit/password";
	}
	
	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public String welcome(Model model){
		Page<Profile> profiles = findProfileService.findAll(new PageRequest(0,	Constants.MAX_PROFILES_PER_PAGE, new Sort("id")));
		model.addAttribute("profiles", profiles.getContent());
		model.addAttribute("page", profiles);
		return "welcome";
	}
	
	@RequestMapping(value="/sign-up", method=RequestMethod.POST)
	public String createProfile(@Valid @ModelAttribute("signUpForm") SignUpForm signUpForm, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			return "sign-up";
		}
		Profile profile = editProfileService.createNewProfile(signUpForm);
		SecurityUtil.authentificate(profile);
		return "redirect:/sign-up-success";
	}
	
	@RequestMapping(value="/sign-up-success")
	public String signUpSuccess(Model model){
		model.addAttribute("profile", editProfileService.profile(SecurityUtil.getCurrentIdProfile()));
		return "/sign-up-success";
	}
	
	@RequestMapping(value="/sign-up-main", method=RequestMethod.GET)
	public String getSignUpMain(Model model){
		model.addAttribute("profile", editProfileService.profile(SecurityUtil.getCurrentIdProfile()));
		return "sign-up-main";
	}
		
	@RequestMapping(value="/fragment/more", method=RequestMethod.GET)
	public String moreProfiles(Model model, @PageableDefault(size=Constants.MAX_PROFILES_PER_PAGE) @SortDefault(sort="id") Pageable pageable) throws UnsupportedEncodingException {
		Page<Profile> profiles = findProfileService.findAll(pageable);
		model.addAttribute("profiles", profiles.getContent());		
		return "fragment/profile-items";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(@ModelAttribute("query")String query, Model model, Pageable pageable) {
		Page<Profile> profiles = findProfileService.findBySearchQuery(query, new PageRequest(0, Constants.MAX_PROFILES_PER_PAGE, new Sort("id")));
		model.addAttribute("profiles", profiles.getContent());
		model.addAttribute("page", profiles);
		return "search";
	}
	
	@RequestMapping(value="/sign-in")
	public String signIn() {
		CurrentProfile currentProfile = SecurityUtil.getCurrentProfile();
		if(currentProfile != null) {
			return "redirect:/" + currentProfile.getUsername();
		} else {
			return "sign-in";
		}
	}
	
	@RequestMapping(value="/sign-in-failed")
	public String signInFailed(HttpSession session) {
		if(session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") == null) {
			return "redirect:/sign-in";
		}
		return "sign-in";
	}
}
