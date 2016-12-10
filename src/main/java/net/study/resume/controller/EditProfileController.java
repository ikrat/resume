package net.study.resume.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.study.resume.form.CertificateForm;
import net.study.resume.form.CourseForm;
import net.study.resume.form.EducationForm;
import net.study.resume.form.HobbiesForm;
import net.study.resume.form.LanguagesForm;
import net.study.resume.form.PracticsForm;
import net.study.resume.form.ProfileForm;
import net.study.resume.form.SkillForm;
import net.study.resume.repository.storage.CertificateCategoryRepository;
import net.study.resume.repository.storage.CoursesCategoryRepository;
import net.study.resume.repository.storage.EducationCategoryRepository;
import net.study.resume.repository.storage.HobbiesCategoryRepository;
import net.study.resume.repository.storage.LanguageCategoryRepository;
import net.study.resume.repository.storage.PracticCategoryRepository;
import net.study.resume.repository.storage.ProfileRepository;
import net.study.resume.repository.storage.SkillCategoryRepository;

@Controller
public class EditProfileController {

	@Autowired
	private SkillCategoryRepository skillCategoryRepository;

	@Autowired
	private ProfileRepository profileRepository;

	@Autowired
	private HobbiesCategoryRepository hobbiesCategoryRepository;

	/*@Autowired
	private CoursesCategoryRepository coursesCategoryRepository;

	@Autowired
	private EducationCategoryRepository educationCategoryRepository;

	@Autowired
	private CertificateCategoryRepository certificateCategoryRepository;

	@Autowired
	private LanguageCategoryRepository languageCategoryRepository;
	
	@Autowired
	private PracticCategoryRepository practicCategoryRepository;*/

	@RequestMapping(value = "/edit/profile", method = RequestMethod.GET)
	public String getEditProfile(@ModelAttribute("profileForm") ProfileForm form) {
		return "edit/profile";
	}

	@RequestMapping(value = "/edit/practic", method = RequestMethod.GET)
	public String getPractics(Model model) {
		model.addAttribute("practicsForm", new PracticsForm(profileRepository.findOne(1L).getPractics()));
		return "edit/practic";
	}

	@RequestMapping(value = "/edit/practic", method = RequestMethod.POST)
	public String savePractics(@Valid @ModelAttribute("practicsForm") PracticsForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/practic";
		}
		// TODO update languages
		return "redirect:/emma-watson";
	}
	
	
	@RequestMapping(value = "/edit/languages", method = RequestMethod.GET)
	public String getLanguages(Model model) {
		model.addAttribute("languagesForm", new LanguagesForm(profileRepository.findOne(1L).getLanguages()));
		return "edit/languages";
	}

	@RequestMapping(value = "/edit/languages", method = RequestMethod.POST)
	public String saveLanguages(@Valid @ModelAttribute("languagesForm") LanguagesForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/languages";
		}
		// TODO update languages
		return "redirect:/emma-watson";
	}

	@RequestMapping(value = "/edit/hobby", method = RequestMethod.GET)
	public String getHobbies(Model model) {
		model.addAttribute("hobbiesForm", new HobbiesForm(profileRepository.findOne(1L).getHobbies()));
		return gotoHobbiesJSP(model);
	}

	@RequestMapping(value = "/edit/hobby", method = RequestMethod.POST)
	public String saveHobbies(@Valid @ModelAttribute("hobbiesForm") HobbiesForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return gotoHobbiesJSP(model);
		}
		// TODO update hobbies
		return "redirect:/emma-watson";
	}

	@RequestMapping(value = "/edit/education", method = RequestMethod.GET)
	public String getEducation(Model model) {
		model.addAttribute("educationForm", new EducationForm(profileRepository.findOne(1L).getEducations()));
		return "edit/education";
	}

	@RequestMapping(value = "/edit/education", method = RequestMethod.POST)
	public String saveEducation(@Valid @ModelAttribute("educationForm") EducationForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/education";
		}
		// TODO update education
		return "redirect:/emma-watson";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.GET)
	public String getCourses(Model model) {
		model.addAttribute("courseForm", new CourseForm(profileRepository.findOne(1L).getCourses()));
		return "edit/courses";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.POST)
	public String saveCourses(@Valid @ModelAttribute("courseForm") CourseForm form, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/courses";
		}
		// TODO update courses
		return "redirect:/emma-watson";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.GET)
	public String getCertificates(Model model) {
		model.addAttribute("certificateForm", new CertificateForm(profileRepository.findOne(1L).getCertificates()));
		return "/edit/certificates";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.POST)
	public String saveCertificates(@Valid @ModelAttribute("certificateForm") CertificateForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "/edit/certificates";
		}
		// TODO update certificates
		return "redirect:/emma-watson";
	}

	@RequestMapping(value = "/edit/skills", method = RequestMethod.GET)
	public String getEditTechSkills(Model model) {
		model.addAttribute("skillForm", new SkillForm(profileRepository.findOne(1L).getSkills()));
		return gotoSkillsJSP(model);
	}

	@RequestMapping(value = "/edit/skills", method = RequestMethod.POST)
	public String saveEditTechSkills(@Valid @ModelAttribute("skillForm") SkillForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return gotoSkillsJSP(model);
		}
		// TODO update skills
		return "redirect:/emma-watson";
	}
	
	private String gotoSkillsJSP(Model model) {
		model.addAttribute("skillCategories", skillCategoryRepository.findAll(new Sort("id")));
		return "edit/skills";
	}


	
	private String gotoHobbiesJSP(Model model) {
		model.addAttribute("hobbiesCategories", hobbiesCategoryRepository.findAll(new Sort("name")));
		return "edit/hobby";
	}
	/*
	private String gotoCertificatesJSP(Model model) {
		model.addAttribute("certificateCategories", certificateCategoryRepository.findAll(new Sort("id")));
		return "edit/certificates";
	}

	private String gotoCoursesJSP(Model model) {
		model.addAttribute("courseCategories", coursesCategoryRepository.findAll(new Sort("id")));
		return "edit/courses";
	}

	private String gotoEducationJSP(Model model) {
		model.addAttribute("educationCategories", educationCategoryRepository.findAll(new Sort("id")));
		return "edit/education";
	}

	private String gotoLanguagesJSP(Model model) {
		model.addAttribute("languageCategories", languageCategoryRepository.findAll(new Sort("id")));
		return "edit/languages";
	}
	
	private String gotoPracticsJSP(Model model) {
		model.addAttribute("practicsCategories", practicCategoryRepository.findAll(new Sort("id")));
		return "edit/practic";
	}*/
}
