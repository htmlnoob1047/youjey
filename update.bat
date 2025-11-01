@echo off
chcp 65001 >nul
title Youjey Safe Update

REM ===============================
REM  프로젝트 루트 경로 설정
REM ===============================
cd /d D:\newjey

echo ===============================
echo  Git 저장소 확인
echo ===============================
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo .git 폴더 없음, 새 Git 저장소 초기화 중...
    git init
    git branch -M main
    git remote add origin https://github.com/htmlnoob1047/youjey.git
) else (
    echo Git 저장소 존재 확인
)

REM ===============================
echo  변경 사항 확인
echo ===============================
git status

REM ===============================
echo  변경 사항 add (수정/추가 파일 모두 포함)
echo ===============================
git add -A

REM ===============================
echo  커밋 메시지 입력
echo ===============================
set /p commit_msg="커밋 메시지를 입력하세요 (Enter 시 기본 메시지 사용): "
if "%commit_msg%"=="" set commit_msg="Update modified and new files"

REM ===============================
echo  커밋 생성 (변경 사항 있을 경우만)
echo ===============================
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "%commit_msg%"
) else (
    echo 변경 사항이 없습니다. commit 생략
)

REM ===============================
echo  변경 사항 push
echo ===============================
git push -u origin main

echo ===============================
echo  완료! GitHub에 변경 사항이 반영되었습니다.
echo ===============================
pause


