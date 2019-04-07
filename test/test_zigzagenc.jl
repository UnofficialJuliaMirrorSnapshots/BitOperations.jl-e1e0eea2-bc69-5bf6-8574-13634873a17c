# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).

using BitOperations
using Test

@testset "zigzag encoding" begin
    @testset "zigzagenc" begin
        @test zigzagenc(0) == 0x0000000000000000
        @test zigzagenc(-1) == 0x0000000000000001
        @test zigzagenc(1) == 0x0000000000000002
        @test zigzagenc(- signed(0x8000000000000000)) == 0xffffffffffffffff
        @test zigzagenc(+ signed(0x7fffffffffffffff)) == 0xfffffffffffffffe
    end


    @testset "zigzagdec" begin
        @test zigzagdec(0x0000000000000000) == 0 
        @test zigzagdec(0x0000000000000001) == -1
        @test zigzagdec(0x0000000000000002) == 1
        @test zigzagdec(0xffffffffffffffff) == - signed(0x8000000000000000)
        @test zigzagdec(0xfffffffffffffffe) == + signed(0x7fffffffffffffff)
    end
end
