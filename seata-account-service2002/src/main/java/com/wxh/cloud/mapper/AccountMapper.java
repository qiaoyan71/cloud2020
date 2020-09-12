package com.wxh.cloud.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface AccountMapper {
    @Update("update t_account set used=used+100,residue=residue-100 where id=1")
    public void test();
}
