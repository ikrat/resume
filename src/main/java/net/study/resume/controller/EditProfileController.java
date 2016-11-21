package net.study.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.study.resume.form.SkillForm;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.repository.storage.SkillCategoryRepository;

@Controller
public class EditProfileController {
	
	@Autowired
	private SkillCategoryRepository skillCategoryRepository;
	
	@Autowired
	private ProfileRepository profileRepository;
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String getEditProfile(){
		return "edit";
	}
	
	@RequestMapping(value="/edit/skills", method=RequestMethod.GET)
	public String getEdiTechtSkills(Model model){
		model.addAttribute("skillForm", new SkillForm(profileRepository.findOne(1L).getSkills()));
		return gotoSkillsJSP(model);
	}
	
	@RequestMapping(value="/edit/skills", method=RequestMethod.POST)
	public String saveEditTechSkills(@ModelAttribute("skillForm") SkillForm form, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return gotoSkillsJSP(model);
		}
		//TODO update skills
		return "redirect:/emma-watson";
	}
	
	private String gotoSkillsJSP (Model model) {
		model.addAttribute("skillCategories", skillCategoryRepository.findAll(new Sort("id")));
		return "edit/skills";
	}
}
