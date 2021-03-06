package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ExplorerRepository;
import repositories.FolderRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Application;
import domain.Configuration;
import domain.Emergency;
import domain.Explorer;
import domain.Finder;
import domain.Folder;
import domain.Message;
import domain.SocialId;
import domain.Story;
import domain.Survival;

@Service
@Transactional
public class ExplorerService {

	// Managed repository

	@Autowired
	private ExplorerRepository explorerRepository;

	@Autowired
	private FolderRepository folderRepository;

	// Supporting services

	// Constructors

	public ExplorerService() {
		super();
	}

	// Simple CRUD methods

	public Explorer create() {
		Explorer res = new Explorer();
		UserAccount userAccount = new UserAccount();
		Authority authority = new Authority();
		Collection<SocialId> socialId = new ArrayList<SocialId>();
		Collection<Folder> folder = new ArrayList<Folder>();
		
		Collection<Message> message = new ArrayList<Message>();
		Folder inBox = new Folder();
		Folder outBox = new Folder();
		Folder notification = new Folder();
		Folder trash = new Folder();
		Folder spam = new Folder();
		inBox.setName("In Box");
		outBox.setName("Out Box");
		notification.setName("Notification");
		trash.setName("Trash");
		spam.setName("Spam");
		inBox.setSystemFolder(true);
		outBox.setSystemFolder(true);
		notification.setSystemFolder(true);
		trash.setSystemFolder(true);
		spam.setSystemFolder(true);
		inBox.setMessages(message);
		outBox.setMessages(message);
		notification.setMessages(message);
		trash.setMessages(message);
		spam.setMessages(message);
		inBox = folderRepository.save(inBox);
		outBox = folderRepository.save(outBox);
		notification = folderRepository.save(notification);
		trash = folderRepository.save(trash);
		spam = folderRepository.save(spam);
		folder.add(inBox);
		folder.add(outBox);
		folder.add(notification);
		folder.add(trash);
		folder.add(inBox);
		folder.add(spam);
		
		Collection<Story> story = new ArrayList<Story>();
		Collection<Application> application = new ArrayList<Application>();
		Finder finder = new Finder();
		Collection<Emergency> emergency = new ArrayList<Emergency>();

		authority.setAuthority(Authority.EXPLORER);
		userAccount.addAuthority(authority);
		res.setUserAccount(userAccount);
		res.setSocialId(socialId);
		res.setFolders(folder);
		res.setStories(story);
		res.setApplication(application);
		res.setFinder(finder);
		res.setEmergency(emergency);
		res.setSuspicious(false);

		return res;
	}

	public Collection<Explorer> findAll() {
		Collection<Explorer> res;
		res = this.explorerRepository.findAll();
		Assert.notNull(res);
		return res;
	}

	public Explorer findOne(int explorer) {
		Assert.isTrue(explorer != 0);
		Explorer res;
		res = this.explorerRepository.findOne(explorer);
		Assert.notNull(res);
		return res;
	}

	public Explorer save(Explorer explorer) {
		Explorer res;

		if (explorer.getId() == 0) {
			String pass = explorer.getUserAccount().getPassword();

			final Md5PasswordEncoder code = new Md5PasswordEncoder();

			pass = code.encodePassword(pass, null);

			explorer.getUserAccount().setPassword(pass);
		}
		res = this.explorerRepository.save(explorer);
		return res;
	}

	public void delete(Explorer explorer) {
		Assert.notNull(explorer);
		Assert.isTrue(explorer.getId() != 0);
		Assert.isTrue(this.explorerRepository.exists(explorer.getId()));
		this.explorerRepository.delete(explorer);
	}

	// Other business methods

	public Explorer findByPrincipal() {
		Explorer res;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		res = this.explorerRepository.findExplorerByUserAccountId(userAccount
				.getId());
		Assert.notNull(res);
		return res;
	}

	public void checkAuthority() {
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		Collection<Authority> authority = userAccount.getAuthorities();
		Assert.notNull(authority);
		Authority res = new Authority();
		res.setAuthority("EXPLORER");
		Assert.isTrue(authority.contains(res));
	}

	public void suspiciousExplorer(Explorer explorer, Configuration configuration){
		Collection<String> spamWords = configuration.getSpamWords();
		

		Collection<Emergency> emergencies = explorer.getEmergency();
		Collection<Folder> folders = explorer.getFolders();
		Collection<SocialId> socialIds = explorer.getSocialId();
		Collection<Story> stories = explorer.getStories();
		Collection<Survival> survivals = explorer.getSurvival();
		Collection<Application> applications = explorer.getApplication();
		
		Explorer newExplorer;
		
		for(String sM: spamWords){
			String s = sM.toLowerCase();
			if(explorer.getAddress().toLowerCase().contains(s) || explorer.getEmail().toLowerCase().contains(s) || explorer.getName().toLowerCase().contains(s) || explorer.getSurname().toLowerCase().contains(s) || explorer.getUserAccount().getUsername().toLowerCase().contains(s)){
				newExplorer = explorer;
				newExplorer.setSuspicious(true);
				this.save(newExplorer);
			}
			for(Application a: applications){
				if(a.getComment().toLowerCase().contains(s) || a.getReason().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}
			for(Emergency e: emergencies){
				if(e.getEmail().toLowerCase().contains(s) || e.getName().toLowerCase().contains(s) || e.getPhoneNumber().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}
			for(Folder f: folders){
				if(f.getName().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}
			for(SocialId sId: socialIds){
				if(sId.getNameSocialNetwork().toLowerCase().contains(s) || sId.getNick().toLowerCase().contains(s) || sId.getPhoto().toLowerCase().contains(s) || sId.getSocialNetwork().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}
			for(Story st: stories){
				if(st.getPieceText().toLowerCase().contains(s) || st.getTitle().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}
			for(Survival su: survivals){
				if(su.getDescription().toLowerCase().contains(s) || su.getTitle().toLowerCase().contains(s)){
					newExplorer = explorer;
					newExplorer.setSuspicious(true);
					this.save(newExplorer);
				}
			}

		}
	}
	
	public Explorer findApplicationOfExplorer(Integer id) {
		Explorer explorer;

		explorer = explorerRepository.findApplicationOfExplorer(id);

		return explorer;
	}
}
