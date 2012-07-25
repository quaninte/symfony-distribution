<?php

namespace iostudio\DefaultBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Template()
     */
    public function indexAction()
    {
        $_format = $this->getRequest()->attributes->get('_mobile') ? 'mobile' : 'html';
        return $this->render('iostudioDefaultBundle:Default:index.'.$_format.'.twig');
    }
}
