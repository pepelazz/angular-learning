package code;

import models.Recipe;
import play.jobs.Job;
import play.jobs.OnApplicationStart;
import play.test.Fixtures;

import java.util.HashMap;

@OnApplicationStart
public class FillDB extends Job {


    public void doJob() {
        if (Recipe.count() == 0) {
            Fixtures.deleteAllModels();
            Fixtures.loadModels("initial-data.yml");
        }

    }

}
