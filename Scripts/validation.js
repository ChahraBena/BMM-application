$('#ValidateForm').bootstrapValidator({
	feedbackIcons: {
		valid:'glyphicon glyphicon-ok',
		invalid:'glyphicon glyphicon-remove',
		validating:'glyphicon glyphicon-refresh'
	},
	fields:{
		Nom: {
			validators :{
				notEmpty:{
					message:'SVP Entrez le nom'
				}
			}
		},
		prenom:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le prénom'
				}
			}
		},
		username:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le nom d''utilisateur'
				}
			}
		},
		matricule:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le matricule'
				}
			}
		},
		password:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le mot de passe'
				}
			}
		},
		confirm:{
			validators:{
				notEmpty:{
					message:'SVP confirmer le mot de passe'
				},
				identical:{
					field:'password'
					message:'entrez le meme mot de passe'
				}
			}
		},
		email:{
			validators:{
				notEmpty:{
					message:'SVP Entrez l adresse email'
				},
				emailAddress:{
					message:'SVP Entrez une adresse valide'
				}
			}
		},
		
			departement:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le nom du département'
				}
			}
		},
			type:{
			validators:{
				notEmpty:{
					message:'SVP Entrez le type de privilège'
				}
			}
		}
	}
});
		
				
		