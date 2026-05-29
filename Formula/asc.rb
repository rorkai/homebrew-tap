# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.6.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.6.1/asc_1.6.1_macOS_arm64'
      sha256 'dbfbf550ba749dfd7e550ff91d3d1ffa453ad1deb3ad36e74f4c522951b93648'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.6.1/asc_1.6.1_macOS_amd64'
      sha256 'f9aa324cb498617696673a97e4ebf1942c06c645341b5093ac5b5c3af005f163'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
