from django.db import models

# Create your models here.

# Automat Django atribuie un ID

class Departament(models.Model):
    nume = models.CharField(max_length=20)
    # manager_id = models.ForeignKey('Angajat', on_delete=models.SET_NULL, null=True, blank=True, related_name="departamente_conduse")
    manager_id = models.IntegerField(null=True)

    def __str__(self):
        return self.nume

class Angajat(models.Model):
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)

    departament = models.ForeignKey('Departament', on_delete=models.SET_NULL, null=True, blank=True, related_name="angajati")
    manager = models.ForeignKey('Angajat', on_delete=models.SET_NULL, null=True, blank=True, related_name="subordonati")

    salariu = models.IntegerField(null=True)
    angajare = models.DateField(null=True)
    vechime = models.DateField(null=True)

    def __str__(self):
            return f'{self.prenume} {self.nume}'