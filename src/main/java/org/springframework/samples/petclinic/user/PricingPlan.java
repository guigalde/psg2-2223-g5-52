package org.springframework.samples.petclinic.user;

public enum PricingPlan {
    BASIC(3,1,2),
    ADVANCED(6,2,4),
    PRO(Integer.MAX_VALUE,4,Integer.MAX_VALUE);

    public int pets;
    public int visitsPerMonth;
    public int vets;

    PricingPlan(int pets, int visitsPerMonth, int vets) {
        this.pets = pets;
        this.visitsPerMonth = visitsPerMonth;
        this.vets = vets;
    }

    public String getName() {
        return this.name();
    }

}
