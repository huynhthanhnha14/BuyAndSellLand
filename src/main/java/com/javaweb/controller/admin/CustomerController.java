package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.StatusCode;
import com.javaweb.enums.TransactionCode;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.TransactionSearchResponse;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller(value="CustomControllerOfAdmin")
public class CustomerController {
    @Autowired
    IUserService userService;
    @Autowired
    ICustomerService customerService;

    @RequestMapping(value="/admin/customer-list", method= RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute(SystemConstant.MODEL) CustomerDTO model, @ModelAttribute("modelSearch")CustomerDTO customerDTO, @RequestParam Map<String, Object> params, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("staffs", userService.getListStaff());
        DisplayTagUtils.of(request, model);
        List<CustomerSearchResponse> customerDTOS = customerService.findAll(params, new PageRequest(model.getPage() - 1, model.getMaxPageItems()));
        model.setTotalItems(customerService.countTotalItems());
        model.setListResult(customerDTOS);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }
    @RequestMapping(value="/admin/customer-edit", method= RequestMethod.GET)
    public ModelAndView addCustomer( @ModelAttribute("customerEdits")CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("transactionType", TransactionCode.transactionType());
        mav.addObject("staffs", userService.getListStaff());
        mav.addObject("statusType", StatusCode.statusType());
        return mav;
    }
    @RequestMapping(value="/admin/customer-edit-{id}", method= RequestMethod.GET)
    public ModelAndView updateCustomer(@PathVariable("id")Long id, @ModelAttribute(SystemConstant.MODEL) CustomerDTO model, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdits", customerService.findById(id));
        mav.addObject("transactionType", TransactionCode.transactionType());
        mav.addObject("staffs", userService.getListStaff());
        mav.addObject("statusType", StatusCode.statusType());
        List<TransactionSearchResponse> transactionDTOS = customerService.displayTransaction(id, new PageRequest(model.getPage() - 1, model.getMaxPageItems()));
        model.setTotalItems(customerService.countTotalItems());
        DisplayTagUtils.of(request, model);
        model.setListResult(transactionDTOS);
        mav.addObject("transactionCode", transactionDTOS);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

}
