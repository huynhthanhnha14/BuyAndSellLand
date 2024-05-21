package com.javaweb.controller.admin;


import com.javaweb.api.admin.BuildingAPI;
import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.enums.districtCode;
import com.javaweb.enums.TypeCode;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    IUserService userService;
    @Autowired
    BuildingAPI buildingAPI;
    @Autowired
    IBuildingService buildingService;



    @RequestMapping(value="/admin/building-list", method= RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute(SystemConstant.MODEL) BuildingDTO model, @ModelAttribute("modelSearch")BuildingDTO buildingDTO,
                                     @RequestParam Map<String, Object> params,
                                     @RequestParam(value = "typeCode", required = false) List<String> type,
                                     HttpServletRequest request, @ModelAttribute BuildingSearchRequest buildingSearchRequest){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("district", districtCode.type());
        mav.addObject("types", TypeCode.type());
        mav.addObject("staffs", userService.getListStaff());
        DisplayTagUtils.of(request, model);
        List<BuildingSearchResponse> buildingDTOS = buildingService.getAllBuilding(params, type, new PageRequest(model.getPage() - 1, model.getMaxPageItems()));
        model.setTotalItems(buildingService.countTotalItems());
        model.setListResult(buildingDTOS);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    @RequestMapping(value="/admin/building-edit", method= RequestMethod.GET)
    public ModelAndView addBuilding(@ModelAttribute("buildingEdit")BuildingDTO buildingDTO) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("district", districtCode.type());
        mav.addObject("types", TypeCode.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-edit-{id}", method= RequestMethod.GET)
    public ModelAndView updateBuilding(@PathVariable("id")Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingService.findById(id));
        mav.addObject("listRentArea", buildingService.listRentArea(id));
        mav.addObject("district", districtCode.type());
        return mav;
    }

    @RequestMapping(value="/admin/building-list-{id}", method= RequestMethod.GET)
    public ModelAndView deleteBuilding(@ModelAttribute("id")Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        return mav;
    }

}

