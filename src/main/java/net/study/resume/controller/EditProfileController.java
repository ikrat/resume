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
import net.study.resume.form.ContactsForm;
import net.study.resume.form.CourseForm;
import net.study.resume.form.EducationForm;
import net.study.resume.form.HobbiesForm;
import net.study.resume.form.LanguagesForm;
import net.study.resume.form.PracticsForm;
import net.study.resume.form.ProfileForm;
import net.study.resume.form.SkillForm;
import net.study.resume.form.UploadForm;
import net.study.resume.repository.storage.HobbiesCategoryRepository;
import net.study.resume.service.EditProfileService;
import net.study.resume.service.PhotoDownloadService;
import net.study.resume.util.SecurityUtil;

@Controller
public class EditProfileController {

	@Autowired
	private EditProfileService editProfileService;
	
	@Autowired
	private HobbiesCategoryRepository hobbiesCategoryRepository;
	
	@Autowired
	private PhotoDownloadService photoDownloadService;

	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditProfile(Model model) {
		model.addAttribute("profileForm", new ProfileForm(editProfileService.profile(SecurityUtil.getCurrentIdProfile())));
		return "edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String saveEditProfile(@ModelAttribute("profileForm") ProfileForm form, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return "edit";
		}
		photoDownloadService.downloadPhoto(form);
		editProfileService.updateProfile(SecurityUtil.getCurrentIdProfile(), form.getProfile());
		return "redirect:/edit/contacts";
	}
	
	@RequestMapping(value="/edit/info", method=RequestMethod.GET)
	public String getInfo(Model model){
		model.addAttribute("profileForm", new ProfileForm(editProfileService.profile(SecurityUtil.getCurrentIdProfile())));
		return "edit/info";
		
	}
	
	@RequestMapping(value="/edit/info", method=RequestMethod.POST)
	public String saveInfo(@ModelAttribute("profileForm") ProfileForm form, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()){
			return "edit/info";
		}
		editProfileService.updateInfo(SecurityUtil.getCurrentIdProfile(), form.getProfile());
		return "redirect:/chris-hemsworth";
	}
	
	@RequestMapping(value="/edit/contacts", method=RequestMethod.GET)
	public String getContacts(Model model) {
		model.addAttribute("contactsForm", new ContactsForm(editProfileService.contacts(SecurityUtil.getCurrentIdProfile())));
		return "edit/contacts";
	}
	
	@RequestMapping(value="/edit/contacts", method=RequestMethod.POST)
	public String saveContacts(@ModelAttribute("contactsForm") ContactsForm contactsForm, BindingResult bindingResult,
			Model model) {
		if(bindingResult.hasErrors()) {
			return "edit/contacts";
		}
		editProfileService.updateContacts(SecurityUtil.getCurrentIdProfile(), contactsForm.getContacts());
		return "redirect:/edit/skills";
	}
	
	@RequestMapping(value = "/edit/practic", method = RequestMethod.GET)
	public String getPractics(Model model) {
		model.addAttribute("practicsForm", new PracticsForm(editProfileService.listPractics(SecurityUtil.getCurrentIdProfile())));
		return "edit/practic";
	}

	@RequestMapping(value = "/edit/practic", method = RequestMethod.POST)
	public String savePractics(@Valid @ModelAttribute("practicsForm") PracticsForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/practic";
		}
		editProfileService.updatePractics(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/certificates";
	}
	
	
	@RequestMapping(value = "/edit/languages", method = RequestMethod.GET)
	public String getLanguages(Model model) {
		model.addAttribute("languagesForm", new LanguagesForm(editProfileService.listLanguages(SecurityUtil.getCurrentIdProfile())));
		return "edit/languages";
	}

	@RequestMapping(value = "/edit/languages", method = RequestMethod.POST)
	public String saveLanguages(@Valid @ModelAttribute("languagesForm") LanguagesForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/languages";
		}
		editProfileService.updateLanguages(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/hobby";
	}

	@RequestMapping(value = "/edit/hobby", method = RequestMethod.GET)
	public String getHobbies(Model model) {
		model.addAttribute("hobbiesForm", new HobbiesForm(editProfileService.listHobbies(SecurityUtil.getCurrentIdProfile())));
		return gotoHobbiesJSP(model);
	}

	@RequestMapping(value = "/edit/hobby", method = RequestMethod.POST)
	public String saveHobbies(@Valid @ModelAttribute("hobbiesForm") HobbiesForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return gotoHobbiesJSP(model);
		}
		editProfileService.updateHobbies(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/info";
	}

	@RequestMapping(value = "/edit/education", method = RequestMethod.GET)
	public String getEducation(Model model) {
		model.addAttribute("educationForm", new EducationForm(editProfileService.listEducations(SecurityUtil.getCurrentIdProfile())));
		return "edit/education";
	}

	@RequestMapping(value = "/edit/education", method = RequestMethod.POST)
	public String saveEducation(@Valid @ModelAttribute("educationForm") EducationForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/education";
		}
		editProfileService.updateEducations(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/languages";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.GET)
	public String getCourses(Model model) {
		model.addAttribute("courseForm", new CourseForm(editProfileService.listCourses(SecurityUtil.getCurrentIdProfile())));
		return "edit/courses";
	}

	@RequestMapping(value = "/edit/courses", method = RequestMethod.POST)
	public String saveCourses(@Valid @ModelAttribute("courseForm") CourseForm form, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "edit/courses";
		}
		editProfileService.updateCourses(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/education";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.GET)
	public String getCertificates(Model model) {
		model.addAttribute("certificateForm", new CertificateForm(editProfileService.listCertificates(SecurityUtil.getCurrentIdProfile())));
		return "/edit/certificates";
	}

	@RequestMapping(value = "/edit/certificates", method = RequestMethod.POST)
	public String saveCertificates(@Valid @ModelAttribute("certificateForm") CertificateForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return "/edit/certificates";
		}
		editProfileService.updateCertificates(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/courses";
	}
	
	
	@RequestMapping(value="/edit/certificates/upload", method=RequestMethod.POST)
	public String uploadCertificates(@ModelAttribute("uploadForm") UploadForm uploadForm, BindingResult bindingResult,
			Model model) {
		if(bindingResult.hasErrors()) {
			return "/edit/certificates";
		} 
		photoDownloadService.downloadCertificate(uploadForm);
		return "redirect:/edit/certificates";
	}

	@RequestMapping(value = "/edit/skills", method = RequestMethod.GET)
	public String getEditTechSkills(Model model) {
		model.addAttribute("skillForm", new SkillForm(editProfileService.listSkills(SecurityUtil.getCurrentIdProfile())));
		return gotoSkillsJSP(model);
	}

	@RequestMapping(value = "/edit/skills", method = RequestMethod.POST)
	public String saveEditTechSkills(@Valid @ModelAttribute("skillForm") SkillForm form, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			return gotoSkillsJSP(model);
		}
		editProfileService.updateSkills(SecurityUtil.getCurrentIdProfile(), form.getItems());
		return "redirect:/edit/practic";
	}
	
	private String gotoSkillsJSP(Model model) {
		model.addAttribute("skillCategories", editProfileService.listSkillCategories());
		return "edit/skills";
	}
	
	private String gotoHobbiesJSP(Model model) {
		model.addAttribute("hobbiesCategories", hobbiesCategoryRepository.findAll(new Sort("id")));
		model.addAttribute("profileForm", new ProfileForm(editProfileService.profile(SecurityUtil.getCurrentIdProfile())));
		return "edit/hobby";
	}
	
}
