package controllers.auditor;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AuditorService;
import controllers.AbstractController;
import domain.Auditor;

@Controller
@RequestMapping("/actor/auditor")
public class ActorAuditorController extends AbstractController {

	// Services -------------------------------------------------------------

	@Autowired
	private AuditorService auditorService;

	// Constructors ---------------------------------------------------------

	public ActorAuditorController() {
		super();
	}

	// Editing ---------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;
		Auditor auditor;

		auditor = this.auditorService.findByPrincipal();
		result = this.createEditModelAndView(auditor);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Auditor auditor,
			final BindingResult binding) {
		ModelAndView res;
		if (binding.hasErrors())
			res = this.createEditModelAndView(auditor, "actor.params.error");
		else
			try {
				this.auditorService.save(auditor);
				res = new ModelAndView("redirect:../../");
			} catch (final Throwable oops) {
				res = this.createEditModelAndView(auditor, "actor.commit.error");
			}

		return res;
	}

	// Ancillary methods --------------------------------------------------

	protected ModelAndView createEditModelAndView(final Auditor auditor) {
		ModelAndView result;

		result = this.createEditModelAndView(auditor, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Auditor auditor,
			final String message) {
		ModelAndView result;
		result = new ModelAndView("actor/edit");
		result.addObject("actor", auditor);
		result.addObject("message", message);
		result.addObject("requestUri", "actor/auditor/edit.do");
		return result;

	}
}
