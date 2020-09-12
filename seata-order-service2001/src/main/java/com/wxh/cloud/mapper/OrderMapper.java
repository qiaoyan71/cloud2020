package com.wxh.cloud.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    @Insert("insert into t_order values(null,11,22,1,100,0)")
    public void test();
}
