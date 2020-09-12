package com.wxh.cloud.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface StorageMapper {
    @Update("UPDATE t_storage set used=used+1,residue=residue-1 where id=1")
    public void test();
}
