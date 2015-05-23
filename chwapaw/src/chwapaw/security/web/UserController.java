package chwapaw.security.web;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import chwapaw.security.User;
import chwapaw.security.service.GroupService;
import chwapaw.security.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired 
	private MessageSource ms; 
	
	@Autowired 
	private UserService us;

	@Autowired 
	private GroupService gs;
	

	
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView launchSignInPage(@ModelAttribute("user") User user, BindingResult result){
		return new ModelAndView("signin");
	}
	
	@RequestMapping(value="/error-signin", method=RequestMethod.GET)
	public ModelAndView invalidLogin() {
		ModelAndView mav = new ModelAndView("signin");
		mav.addObject("error", ms.getMessage("chwapaw.signin.invalid", null, LocaleContextHolder.getLocale()));
		return mav;
	}
	
	@RequestMapping(value = "/signed", method = RequestMethod.GET)
	public ModelAndView launchUserPage(){
		User usr = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView mav;
		mav = new ModelAndView("redirect:/user.cp?language="+usr.getLanguage());		
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView ui(){
		User usr = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("redirect:/"+usr.getGroup().getViewer());
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView mainPage(){
		User usr = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView mav = new ModelAndView("admin");
		mav.addObject("currentUser", usr);
		return mav;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView launchCreateUsers(@ModelAttribute("user") User user, BindingResult result){
		return new ModelAndView("createUser");
	}
	
	@RequestMapping(value = "/list-user", method = RequestMethod.GET)
	public ModelAndView launchListUsers(@ModelAttribute("user") User user, BindingResult result){
		ModelAndView mav = new ModelAndView("listUsers");
		mav.addObject("listUser",us.getUsers());
		mav.addObject("nbr_users",us.getUsers().size());
		return mav;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam(value="uuid", required=true) String uuid, Model model){
		model.addAttribute("user", us.getUserByUuId(uuid));
		return new ModelAndView("createUser");
	} 
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public ModelAndView remove(@RequestParam(value="uuid", required=true) String uuid, Model model){
			us.removeUserByUuid(uuid);
		return new ModelAndView("redirect:/user/list-user.cp");
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user, BindingResult br){
		ModelAndView mav = new ModelAndView("createUser");
		String str = "create";
		/*if(user.getUuid()!=null)
			str = "chwapaw.edit";*/
		if(user.getUsername().isEmpty())
			br.reject("chwapaw.required", 
					   new Object[]{ms.getMessage("chwapaw.username", null, LocaleContextHolder.getLocale())}, 
					   "The field username is required");
		else if(us.getUserByUsername(user.getUsername())!=null)
			br.reject("chwapaw.existed.object", new Object[]{ms.getMessage("chwapaw.username", null, LocaleContextHolder.getLocale())}, 
					  "That Username is already existed in the database");

		else if(user.getPerson().getFirstname().isEmpty())
			br.reject("chwapaw.required", 
					   new Object[]{ms.getMessage("chwapaw.firstname", null, LocaleContextHolder.getLocale())}, 
					   "The field firstname is required");
		else if(user.getPerson().getLastname().isEmpty())
			br.reject("chwapaw.required", 
					   new Object[]{ms.getMessage("chwapaw.lastname", null, LocaleContextHolder.getLocale())}, 
					   "The field lastname is required");
		
		else if(user.getPerson().getGender().equalsIgnoreCase("0"))
			br.reject("chwapaw.required", 
					   new Object[]{ms.getMessage("chwapaw.gender", null, LocaleContextHolder.getLocale())}, 
					   "The field gender is required");
		else if(user.getLanguage().equalsIgnoreCase("0"))
			br.reject("chwapaw.required", 
					   new Object[]{ms.getMessage("chwapaw.language", null, LocaleContextHolder.getLocale())}, 
					   "The field language is required");
		
		else if(user.getEmail().isEmpty())
			br.reject("chwapaw.required", new Object[]{ms.getMessage("chwapaw.email", null, LocaleContextHolder.getLocale())}, 
					  "The field Email is required");
	
		else {
			try {
				us.saveUser(user);
				mav = new ModelAndView("redirect:/user/list-user.cp");
				str = "chwapaw.success";
			} catch(Exception e){
				br.reject("chwapaw.error", new Object[]{e.getMessage()+e.getCause()},""+e.getMessage()+e.getLocalizedMessage()+e.toString()+e.getStackTrace()+e.getSuppressed());
			}
		}

		//mav.addObject("success", ms.getMessage(str, null, LocaleContextHolder.getLocale()));
		return mav;
	}
	
}
