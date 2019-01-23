package io.renren.modules.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysIconEntity;
import io.renren.modules.sys.service.SysIconService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author:zsk
 * @CreateTime:2019-01-23 11:47
 */
@RestController
@RequestMapping("/sys/icon")
public class SysIconController {
    @Autowired
    private SysIconService sysIconService;

    /*
    * 获取图标
    * */

    @RequestMapping("list")
    public R list(@RequestParam Map<String, Object> params){

        boolean statusTemp1 = false;
        boolean statusTemp2 = false;
        Object statusOb = params.get("status");
        String statusStr;
        if(null == statusOb){
            statusTemp2 = true;
        }else{
            statusStr = statusOb.toString();
            if(statusStr.contains("0")){
                statusTemp1 = true;
            }
            if(statusStr.contains("1")){
                statusTemp2 = true;
            }
        }

        List<SysIconEntity> sysIconEntityList =  sysIconService.list(new QueryWrapper<SysIconEntity>()
                .eq(statusTemp1,"status",0)
                .eq(statusTemp2,"status",1));
        Map sysIconEntityMap =sysIconEntityList.stream().collect(Collectors.groupingBy(SysIconEntity::getType));
        return R.ok().put("list",sysIconEntityMap);
    }
}
