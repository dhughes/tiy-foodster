package com.theironyard.entity;

public class Instruction {

    private Integer id;
    private String instruction;

    public Instruction(int id, String instruction) {

        this.id = id;
        this.instruction = instruction;
    }

    public Instruction(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    @Override
    public String toString() {
        return "Instruction{" +
                "id=" + id +
                ", instruction='" + instruction + '\'' +
                '}';
    }
}
