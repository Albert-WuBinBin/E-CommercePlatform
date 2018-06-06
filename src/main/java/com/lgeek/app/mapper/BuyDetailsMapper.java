package com.lgeek.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lgeek.app.model.BuyDetails;

public interface BuyDetailsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    int insert(BuyDetails record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    int insertSelective(BuyDetails record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    BuyDetails selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    int updateByPrimaryKeySelective(BuyDetails record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table BuyDetails
     *
     * @mbg.generated Mon Jun 04 14:46:37 CST 2018
     */
    int updateByPrimaryKey(BuyDetails record);
    
    List<BuyDetails> getUnfinishedOrdersByUid(@Param("u_id")String u_id);
    List<BuyDetails> getUnfinishedOrdersByOrderId(@Param("orderId")String orderId);
    int payment(@Param("name")String name,@Param("orderId")String orderId);
    
}