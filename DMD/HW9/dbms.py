# -*- coding: utf-8 -*-
import sys
import random

class Student:
    def __init__(self, record):
        self.record = record

    def __str__(self):
        ret = ''
        for field, spec in zip(self.record, self.scheme):
            assert spec[1] >= len(field)
            ret += (self.empty_char * (spec[1] - len(field)) + field)
        return ret

    @staticmethod
    def get_empty():
        return Student(('','','',''))

    empty_char = '.'

    scheme = [
            ('id', 10),
            ('name', 20),
            ('email', 40),
            ('address', 40),
            ]

    data = [
            ('1', 'Andrew', 'andrewtropin@gmail.com', 'University st. 1'),
            ('2', 'John', 'john@gmail.com', 'University st. 1'),
            ('3', 'Dron', 'dron@gmail.com', 'University st. 1'),
            ('4', 'Tom', 'tom@gmail.com', 'St. Petesburg University st. 1'),
            ]

    file_name = 'students.txt'

    @classmethod
    def record_size(cls):
        ret = 0
        for spec in cls.scheme:
            ret += spec[1]

        return ret


class Employee:
    def __init__(self, record):
        self.record = record

    def __str__(self):
        ret = ''
        for field, spec in zip(self.record, self.scheme):
            assert spec[1] >= len(field)
            ret += (self.empty_char * (spec[1] - len(field)) + field)
        return ret

    @staticmethod
    def get_empty():
        return Employee(('','','',''))

    empty_char = '.'

    scheme = [
            ('id', 10),
            ('name', 20),
            ('designation', 40),
            ('address', 40),
            ]

    data = [
            ('1', 'Andrew', 'andrewtropin@gmail.com', 'University st. 1'),
            ('2', 'John', 'john@gmail.com', 'University st. 1'),
            ('3', 'Dron', 'dron@gmail.com', 'University st. 1'),
            ('4', 'Tom', 'tom@gmail.com', 'St. Petesburg University st. 1'),
            ]

    file_name = 'employee.txt'

    @classmethod
    def record_size(cls):
        ret = 0
        for spec in cls.scheme:
            ret += spec[1]

        return ret


class DBMS:
    page_size = 8 * 1024

    def __init__(self, rt):
        self.rt = rt
        self.file_name = rt.file_name
        self.touch_file(self.file_name)
        self.fl = open(self.file_name, 'r+')

    def touch_file(self, file_name):
        import os.path
        if not os.path.isfile(file_name):
            with open(file_name, 'w+') as fl:
                fl.write(self.rt.empty_char * (self.page_size))

    def write_all(self):
        #  fl = sys.stdout
        bytes_writed = 0
        for record in self.rt.data:
            offset = self.get_offset(record[0])
            self.fl.seek(offset)
            self.fl.write(str(Student(record)))
            bytes_writed += self.rt.record_size()
        assert self.page_size >= bytes_writed
        self.fl.write(self.rt.empty_char * (self.page_size - bytes_writed))

    def read_all(self):
        self.fl.seek(0)
        while True:
            record = self.fl.read(self.rt.record_size())
            if not record:
                break
            if record[0:self.rt.scheme[0][1]] != self.rt.empty_char * self.rt.scheme[0][1]:
                print record

    @staticmethod
    def hash(item):
        return int(item) - 1

    def get_offset(self, id):
        return (self.hash(id) * self.rt.record_size()) % self.page_size

    def get(self, id):
        offset = self.get_offset(id)
        self.fl.seek(offset)
        print self.fl.read(self.rt.record_size())

    def update(self, record):
        id = int(record[0])
        offset = self.get_offset(id)
        self.fl.seek(offset)
        self.fl.write(str(self.rt(record)))

    def delete(self, id):
        offset = self.get_offset(id)
        self.fl.seek(offset)
        self.fl.write(str(self.rt.get_empty()))

    def insert(self, rec):
        max_id = (self.page_size / self.rt.record_size())
        id = random.randint(0, max_id)
        ins_rec = list(rec)
        ins_rec.insert(0, id)

        while True:
            id = id % max_id
            ins_rec[0] = str(id)
            offset = self.get_offset(id)
            self.fl.seek(offset)
            record = self.fl.read(self.rt.record_size())
            if not record:
                break
            if record[0:self.rt.scheme[0][1]] == self.rt.empty_char * self.rt.scheme[0][1]:
                self.update(ins_rec)
                break
            id += 1


def main():
    db = DBMS(Student)
    #  db.write_all()
    db.read_all()
    #  #  db.update(('1', 'Johny', 'john@gmail.com', 'University st. 1'))
    #  #  db.update(('2', 'Johny', 'john@gmail.com', 'University st. 1'))
    #  db.insert(('Johny', 'john@gmail.com', 'University st. 1'))
    db.delete(2)
    db.read_all()


if __name__ == "__main__":
    main()

