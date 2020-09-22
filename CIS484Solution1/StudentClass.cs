//John Paul Wehner
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CIS484Solution1
{
    
    
    public class Student
    {
        private string firstName;
        private string lastName;
        private int age;
        private string notes;
        private string tshirtSize;
        private string tshirtColor;
        private int schoolID;
        private int teacherID;

        public Student(string firstName, string lastName, int age, string notes, string tshirtSize, string tshirtColor, int schoolID, int teacherID)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.age = age;
            this.notes = notes;
            this.tshirtSize = tshirtSize;
            this.tshirtColor = tshirtColor;
            this.schoolID = schoolID;
            this.teacherID = teacherID;
        }
        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                this.firstName = value;
            }
        }
        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                this.lastName = value;
            }
        }
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                this.age = value;
            }
        }
        public string Notes
        {
            get
            {
                return notes;
            }
            set
            {
                this.notes = value;
            }
        }
        public string TshirtSize
        {
            get
            {
                return tshirtSize;
            }
            set
            {
                this.tshirtSize = value;
            }
        }
        public string TshirtColor
        {
            get
            {
                return tshirtColor;
            }
            set
            {
                this.tshirtColor = value;
            }
        }
        public int SchoolID
        {
            get
            {
                return schoolID;
            }
            set
            {
                this.schoolID = value;
            }
        }
        public int TeacherID
        {
            get
            {
                return teacherID;
            }
            set
            {
                this.teacherID = value;
            }
        }
    }
}