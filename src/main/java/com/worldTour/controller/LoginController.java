package com.worldTour.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.worldTour.model.Client;
import com.worldTour.model.Emploee;
import com.worldTour.model.Flight;
import com.worldTour.model.Hotel;
import com.worldTour.model.Order;
import com.worldTour.model.Resort;
import com.worldTour.model.User;
import com.worldTour.repository.ClientRepository;
import com.worldTour.repository.EmploeeRepository;
import com.worldTour.repository.FlightRepository;
import com.worldTour.repository.HotelRepository;
import com.worldTour.repository.OrderRepository;
import com.worldTour.repository.ResortRepository;
import com.worldTour.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private ClientRepository clientRepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private FlightRepository flightRepository;
	@Autowired
	private HotelRepository hotelRepository;
	@Autowired
	private ResortRepository resortRepository;
	@Autowired
	private EmploeeRepository emploeeRepository;
	
	@Autowired
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView registration() {
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("registration");
		return modelAndView;
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();
		User userExists = userService.findUserByEmail(user.getEmail());
		if (userExists != null) {
			bindingResult.rejectValue("email", "error.user",
					"There is already a user registered with the email provided");
		}
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("registration");
		} else {
			userService.saveUser(user);
			modelAndView.addObject("successMessage", "User has been registered successfully");
			modelAndView.addObject("user", new User());
			modelAndView.setViewName("registration");

		}
		return modelAndView;
	}

	@RequestMapping(value = "/login/home", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUserByEmail(auth.getName());
		modelAndView.addObject("userName", user.getName()) ;
		modelAndView.addObject("userLastName", user.getLastName());
		modelAndView.addObject("userEmail", user.getEmail());
		modelAndView.setViewName("/home");
		
		modelAndView.addObject("clients", clientRepository.findAll());
		modelAndView.addObject("clientSave", new Client());
		modelAndView.addObject("orders", orderRepository.findAll());
		modelAndView.addObject("orderSave", new Order());
		modelAndView.addObject("flights", flightRepository.findAll());
		modelAndView.addObject("hotels", hotelRepository.findAll());
		modelAndView.addObject("resorts", resortRepository.findAll());
		modelAndView.addObject("emploeers", emploeeRepository.findAll());		
		
		return modelAndView;
	}
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView adminHome() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUserByEmail(auth.getName());
		modelAndView.addObject("userName", user.getName()) ;
		modelAndView.addObject("userLastName", user.getLastName());
		modelAndView.addObject("userEmail", user.getEmail());
		modelAndView.addObject("adminMessage", "АРМ Администратора");
		modelAndView.setViewName("/admin/home");
		
		modelAndView.addObject("clients", clientRepository.findAll());
		modelAndView.addObject("clientSave", new Client());
		modelAndView.addObject("orders", orderRepository.findAll());
		modelAndView.addObject("orderSave", new Order());
		modelAndView.addObject("flights", flightRepository.findAll());
		modelAndView.addObject("flightSave", new Flight());
		modelAndView.addObject("hotels", hotelRepository.findAll());
		modelAndView.addObject("hotelSave", new Hotel());
		modelAndView.addObject("resorts", resortRepository.findAll());
		modelAndView.addObject("resortSave", new Resort());
		modelAndView.addObject("emploeers", emploeeRepository.findAll());
		modelAndView.addObject("emploeeSave", new Emploee());
		return modelAndView;
	}
}
