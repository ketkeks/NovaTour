package com.worldTour.controller;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.worldTour.model.Client;
import com.worldTour.model.Comment;
import com.worldTour.model.Emploee;
import com.worldTour.model.Flight;
import com.worldTour.model.Hotel;
import com.worldTour.model.Order;
import com.worldTour.model.Resort;
import com.worldTour.repository.ClientRepository;
import com.worldTour.repository.CommentRepository;
import com.worldTour.repository.EmploeeRepository;
import com.worldTour.repository.FlightRepository;
import com.worldTour.repository.HotelRepository;
import com.worldTour.repository.OrderRepository;
import com.worldTour.repository.ResortRepository;


@Controller
public class ClientController {
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
	private CommentRepository commentRepository;
	@Autowired
	private JavaMailSender sender;
	
	@RequestMapping("/")
	public String start(Model model) {
		model.addAttribute("comment", new Comment());
		return "index";
	}

	@RequestMapping(value="/",method=RequestMethod.POST)
	public String save(@Valid @ModelAttribute("comment") Comment coment, BindingResult result) {
		if (result.hasErrors()) {
			return "error";
		}
		commentRepository.save(coment);
		try {
			sendEmail(coment);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		return "redirect:/";
		
	}
	
	@PostMapping("/login/saveClient.do")
	public String saveClient(@Valid @ModelAttribute("clientSave") Client clientSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("orderSave", new Order());
			return "home";
			
		}
		clientRepository.save(clientSave);
		return "redirect:/login/home";
	}

	@PostMapping("/login/saveOrder.do")
	public String saveOrder(@Valid @ModelAttribute("orderSave") Order orderSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("clientSave", new Client());
			return "home";
		}
		orderRepository.save(orderSave);
		return "redirect:/login/home";
	}
	
	
	@PostMapping("/admin/saveClient.do")
	public String saveClientAdmin(@Valid @ModelAttribute("clientSave") Client clientSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("orderSave", new Order());
			model.addAttribute("flightSave", new Flight());
			model.addAttribute("hotelSave", new Hotel());
			model.addAttribute("resortSave", new Resort());
			model.addAttribute("emploeeSave", new Emploee());
			return "admin/home";
			
		}
		clientRepository.save(clientSave);
		return "redirect:/admin/home";
	}
	@PostMapping("/admin/saveOrder.do")
	public String saveOrderAdmin(@Valid @ModelAttribute("orderSave") Order orderSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("clientSave", new Client());
			model.addAttribute("flightSave", new Flight());
			model.addAttribute("hotelSave", new Hotel());
			model.addAttribute("resortSave", new Resort());
			model.addAttribute("emploeeSave", new Emploee());
			return "admin/home";
		}
		orderRepository.save(orderSave);
		return "redirect:/admin/home";
	}

	@PostMapping("/admin/saveEmploee.do")
	public String saveEmploeeAdmin(@Valid @ModelAttribute("emploeeSave") Emploee emploeeSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("clientSave", new Client());
			model.addAttribute("flightSave", new Flight());
			model.addAttribute("hotelSave", new Hotel());
			model.addAttribute("resortSave", new Resort());
			model.addAttribute("orderSave", new Order());
			return "admin/home";
		}
		emploeeRepository.save(emploeeSave);
		return "redirect:/admin/home";
	}
	@PostMapping("/admin/saveFlight.do")
	public String saveFlightAdmin(@Valid @ModelAttribute("flightSave") Flight flightSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("clientSave", new Client());
			model.addAttribute("orderSave", new Order());
			model.addAttribute("hotelSave", new Hotel());
			model.addAttribute("resortSave", new Resort());
			model.addAttribute("emploeeSave", new Emploee());
			return "admin/home";
			
		}
		flightRepository.save(flightSave);
		return "redirect:/admin/home";
	}
	@PostMapping("/admin/saveHotel.do")
	public String saveHotelAdmin(@Valid @ModelAttribute("hotelSave") Hotel hotelSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("orderSave", new Order());
			model.addAttribute("clientSave", new Client());
			model.addAttribute("flightSave", new Flight());
			model.addAttribute("resortSave", new Resort());
			model.addAttribute("emploeeSave", new Emploee());
			return "admin/home";
		}
		hotelRepository.save(hotelSave);
		return "redirect:/admin/home";
	}

	@PostMapping("/admin/saveResort.do")
	public String saveResortAdmin(@Valid @ModelAttribute("resortSave") Resort resortSave, BindingResult res, Model model) {
		if (res.hasErrors()) {
			model.addAttribute("emploeeSave", new Emploee());
			model.addAttribute("clientSave", new Client());
			model.addAttribute("flightSave", new Flight());
			model.addAttribute("hotelSave", new Hotel());
			model.addAttribute("orderSave", new Order());
			return "admin/home";
		}
		resortRepository.save(resortSave);
		return "redirect:/admin/home";
	}
	
	private void sendEmail(Comment coment) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setTo("ketkeks@gmail.com");
		StringBuilder builder = new StringBuilder();
		builder.append("New comment saved! Info :").append("\nFIO: " + coment.getFio())
				.append("\nMessage: " + coment.getMessage()).append("\nEmail: " + coment.getEmail());
		helper.setText(builder.toString());
		helper.setSubject("New comment added");

		sender.send(message);
	}
	
}

